import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fydaa_assignment/core/constants.dart';
import 'package:fydaa_assignment/presentation/components/global_components.dart';
import 'package:fydaa_assignment/presentation/components/otp_input.dart';

class OtpInputPage extends StatefulWidget {
  final String mobileNo;
  const OtpInputPage({
    super.key,
    required this.mobileNo,
  });

  @override
  State<OtpInputPage> createState() => _OtpInputPageState();
}

class _OtpInputPageState extends State<OtpInputPage> {
  bool? otpVerified;
  late Timer _timer;
  int _seconds = 170;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (timer) => setState(
        () {
          if (_seconds == 0) {
            _timer.cancel();
          } else {
            _seconds--;
          }
        },
      ),
    );
  }

  void resetTimer() {
    setState(() => _seconds = 170);
    startTimer();
  }

  String get timerText {
    int minutes = _seconds ~/ 60;
    int seconds = _seconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String maskMobileNumber(String number) {
    String formattedNumber =
        '(${number.substring(0, 1)}**) ***-**${number.substring(8, 10)}';
    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return fScaffold(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Verify your phone", style: FTextStyles.bigTitle500),
          fVerticalSpace(space: 18),
          Text(
              "Enter the verification code sent to ${maskMobileNumber(widget.mobileNo)}",
              style: FTextStyles.paleSkySubtitle400),
          fVerticalSpace(space: 18),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: otpVerified != null
                  ? Color(otpVerified! ? 0xff43BF77 : 0xffEA5959)
                  : null,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OTPInput(
                  onCompleted: (input) {
                    if (input.length < 6) {
                      otpVerified = null;
                    } else {
                      if (input == "934477") {
                        otpVerified = true;
                      } else {
                        otpVerified = false;
                      }
                    }
                    setState(() {});
                  },
                  boxCount: 6,
                ),
                fVerticalSpace(space: 14),
                if (otpVerified == null) ...[
                  Text("Verification code expires in $timerText")
                ] else ...[
                  if (otpVerified!)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.string(checkSVG),
                        fHorizontalSpace(),
                        const Text("Verified",
                            style: FTextStyles.whiteRegular600),
                      ],
                    ),
                  if (!otpVerified!)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.string(crossSVG),
                        fHorizontalSpace(),
                        const Text("Invalid OTP",
                            style: FTextStyles.whiteRegular600),
                      ],
                    )
                ]
              ],
            ),
          ),
          const Spacer(),
          outlineBtn(
              title: "Resend Code",
              onTap: _seconds == 0 ? () => resetTimer() : null),
          fVerticalSpace(space: 18),
          outlineBtn(
            title: "Change Number",
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Widget outlineBtn({VoidCallback? onTap, required String title}) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
          overlayColor: MaterialStatePropertyAll(ebony.withOpacity(0.1)),
          foregroundColor: const MaterialStatePropertyAll(ebony),
          textStyle: const MaterialStatePropertyAll(FTextStyles.ebonyBtnTitle)),
      child: Text(title),
    );
  }
}
