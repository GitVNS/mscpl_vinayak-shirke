import 'package:flutter/material.dart';
import 'package:fydaa_assignment/core/constants.dart';
import 'package:fydaa_assignment/presentation/components/global_components.dart';
import 'package:fydaa_assignment/presentation/pages/otp_input_page.dart';

class MobileInputPage extends StatefulWidget {
  const MobileInputPage({super.key});

  @override
  State<MobileInputPage> createState() => _MobileInputPageState();
}

class _MobileInputPageState extends State<MobileInputPage> {
  TextEditingController mobileNoController = TextEditingController();
  String? mobileNo;
  bool allowFydaa = false;

  bool getOTPBtnEnabled() => allowFydaa && mobileNo?.length == 10;

  @override
  Widget build(BuildContext context) {
    return fScaffold(
      enableBack: false,
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Enter your mobile no", style: FTextStyles.ebonyTitle700),
          fVerticalSpace(space: 6),
          const Text("We need to verity your number",
              style: FTextStyles.paleSkySubtitle400),
          fVerticalSpace(space: 32),
          const Text("Mobile Number", style: FTextStyles.ebonyRegular400),
          fVerticalSpace(),
          TextField(
            controller: mobileNoController,
            decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                hintText: "Enter mobile no",
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14, color: paleSky),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(20)),
            onChanged: (value) => setState(() => mobileNo = value),
            keyboardType: TextInputType.phone,
            maxLength: 10,
            buildCounter: (context,
                    {required currentLength, required isFocused, maxLength}) =>
                const SizedBox(),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: getOTPBtnEnabled()
                ? () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => OtpInputPage(mobileNo: mobileNo!)))
                : null,
            style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(white),
                padding: MaterialStatePropertyAll(EdgeInsets.all(23)),
                backgroundColor: MaterialStatePropertyAll(greyscale),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))))),
            child: const Text("Get OTP"),
          ),
          const Spacer(flex: 2),
          CheckboxListTile(
            value: allowFydaa,
            onChanged: (value) => setState(() => allowFydaa = value!),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            title: const Text(
                "Allow fydaa to send financial knowledge and critical alerts on your WhatsApp.",
                style: FTextStyles.paleSkySmall400),
          ),
        ],
      ),
    );
  }
}
