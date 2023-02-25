import 'package:flutter/material.dart';

class Constants {
  static const String logo = 'assets/images/nla.png';
  static const String appName = 'National Lottery Authority';

  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  static const String appCopyright = 'Copyright © 2020';
  static const String appCompany = 'NLA';
  // static const String appCompanyWebsite =
  //     'https://core.fastpaymentcentres.com/core/v1/';
  static const String appCompanyWebsite = 'http://nla.com.gh/';
  static const String appCompanyEmail = 'info@nla.com.gh';
  static const String appCompanyPhone = '+233558535033';
  static const String appCompanyAddress = '';
  static const String appCompanyCity = '';
  static const String appCompanyState = '';
  static const String appCompanyCountry = '';
  static const String appCompanyPostalCode = '';
  static const String appCompanyFax = '';

  // static const Color primaryColor = Colors.teal;
  static const Color primaryColor = Color(0xFF019342);
  static const Color secondaryColor = Color(0xfffcb900);

  Widget space = Builder(builder: (BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  });
  static Widget spaceMedium = Builder(builder: (BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  });
  static Widget spaceLarge = Builder(builder: (BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
    );
  });
  static Widget spaceSmall = Builder(builder: (BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  });
  static Widget safeArea = Builder(builder: (BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );
  });
}
