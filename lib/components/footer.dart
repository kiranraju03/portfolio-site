import 'package:flutter/material.dart';
import 'package:flutter_portfolio/config/colors.dart';
import 'package:flutter_portfolio/config/sizes.dart';
import 'package:flutter_portfolio/models/contact_model.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<Contact> footerItems = [
  Contact(type: "ADDRESS", contactInfo: 'RR Nagar'),
  Contact(type: "EMAIL", contactInfo: 'kiran.raju.k.43@gmail.com'),
  Contact(type: "CALL/WHATSAPP", contactInfo: '+91 7406074675')
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                          height: 120.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Image.asset(
                                    //   footerItem.iconPath,
                                    //   width: 25.0,
                                    // ),
                                    // SizedBox(
                                    //   width: 15.0,
                                    // ),
                                    Text(
                                      footerItem.type,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${footerItem.contactInfo}",
                                        style: TextStyle(
                                          color: kCaptionColor,
                                          height: 1.8,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // Flex(
              //   direction: ScreenHelper.isMobile(context)
              //       ? Axis.vertical
              //       : Axis.horizontal,
              //   mainAxisAlignment: ScreenHelper.isMobile(context)
              //       ? MainAxisAlignment.center
              //       : MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(bottom: 8.0),
              //       child: Text(
              //         "Copyright (c) 2021 Michele Harrington. All rights Reserved",
              //         style: TextStyle(
              //           color: kCaptionColor,
              //         ),
              //       ),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         GestureDetector(
              //           onTap: () {},
              //           child: MouseRegion(
              //             cursor: SystemMouseCursors.click,
              //             child: Text(
              //               "Privacy Policy",
              //               style: TextStyle(
              //                 color: kCaptionColor,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.symmetric(horizontal: 8.0),
              //           child: Text(
              //             "|",
              //             style: TextStyle(
              //               color: kCaptionColor,
              //             ),
              //           ),
              //         ),
              //         GestureDetector(
              //           onTap: () {},
              //           child: MouseRegion(
              //             cursor: SystemMouseCursors.click,
              //             child: Text(
              //               "Terms & Conditions",
              //               style: TextStyle(
              //                 color: kCaptionColor,
              //               ),
              //             ),
              //           ),
              //         )
              //       ],
              //     )
              //   ],
              // )
            ],
          );
        },
      ),
    ),
  );
}
