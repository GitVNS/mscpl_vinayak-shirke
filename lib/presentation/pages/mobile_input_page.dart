import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fydaa_assignment/core/constants.dart';
import 'package:fydaa_assignment/presentation/components/global_components.dart';
import 'package:fydaa_assignment/presentation/pages/otp_input_page.dart';

class MobileInputPage extends StatelessWidget {
  const MobileInputPage({super.key});

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
            decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                hintText: "Enter mobile no",
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14, color: paleSky),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(20)),
            onChanged: (value) {},
            keyboardType: TextInputType.phone,
            maxLength: 10,
            buildCounter: (context,
                    {required currentLength, required isFocused, maxLength}) =>
                const SizedBox(),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const OtpInputPage())),
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(23)),
                backgroundColor: MaterialStatePropertyAll(greyscale),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))))),
            child: const Text("Get OTP"),
          ),
          const Spacer(flex: 2),
          Row(
            children: [
              SvgPicture.string(radiosSVG),
              fHorizontalSpace(),
              const Flexible(
                child: Text(
                    "Allow fydaa to send financial knowledge and critical alerts on your WhatsApp.",
                    style: FTextStyles.paleSkySmall400),
              )
            ],
          ),
        ],
      ),
    );
  }
}
