import 'package:flutter/material.dart';

const String backArrowSVG =
    '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M15 6L10.4142 10.5858C9.63317 11.3668 9.63316 12.6332 10.4142 13.4142L15 18" stroke="#0D1D33" stroke-width="2" stroke-linecap="round"/></svg>';
const String checkSVG =
    '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 12L9 17L20 6" stroke="white" stroke-width="2.4" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/></svg>';
const String crossSVG =
    '<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_403_197)"><path d="M9.90909 7.36364L12.4716 11.625H12.5625L15.1364 7.36364H17.5398L13.9545 13.1818L17.5966 19H15.1534L12.5625 14.767H12.4716L9.88068 19H7.44886L11.125 13.1818L7.49432 7.36364H9.90909Z" fill="white"/></g><defs><clipPath id="clip0_403_197"><rect x="0.5" width="24" height="24" rx="4" fill="white"/></clipPath></defs></svg>';
const String radiosSVG =
    '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 0C5.376 0 0 5.376 0 12C0 18.624 5.376 24 12 24C18.624 24 24 18.624 24 12C24 5.376 18.636 0 12 0ZM12.036 17.076C9.228 17.076 6.96 14.808 6.96 12C6.96 9.192 9.228 6.924 12.036 6.924C14.844 6.924 17.112 9.192 17.112 12C17.112 14.808 14.844 17.076 12.036 17.076Z" fill="#007DFB"/></svg>';

const double fPadding = 24;

const Color ebony = Color(0xff101828);
const Color paleSky = Color(0xff667085);
const Color greyscale = Color(0xff111827);
const Color white = Color(0xffffffff);

class FTextStyles {
  static const TextStyle ebonyTitle700 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: ebony);
  static const TextStyle ebonyBtnTitle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: ebony);
  static const TextStyle bigTitle500 = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 32, color: Color(0xff0D1D33));
  static const TextStyle paleSkySubtitle400 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: paleSky);
  static const TextStyle paleSkySmall400 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: paleSky);
  static const TextStyle ebonyRegular400 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: ebony);
  static const TextStyle whiteRegular600 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: white);
}
