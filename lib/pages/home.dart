import 'dart:convert';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/download_resumes_section.dart';
import 'package:flutter_portfolio/components/education_section.dart';
import 'package:flutter_portfolio/components/experience_section.dart';
import 'package:flutter_portfolio/components/footer.dart';
import 'package:flutter_portfolio/components/header.dart';
import 'package:flutter_portfolio/components/skill_section.dart';
import 'package:flutter_portfolio/components/testimonials_section.dart';
import 'package:flutter_portfolio/config/colors.dart';
import 'package:flutter_portfolio/config/header_items.dart';
import 'package:flutter_portfolio/models/experience_model.dart';
import 'package:flutter_portfolio/utils/global_keys.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home> {
  late List<Experience> experiences = [];
  Future<List<Experience>> setUserData(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString(
      "user/user_data.json",
    );
    Map<String, dynamic> formattedData = json.decode(data);
    // final jsonResult = json.decode(formattedData['experience'].toString());
    return (formattedData['experience'] as List)
        .map((e) => Experience.fromJson(e))
        .toList();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    experiences = await setUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: ListView.separated(
              itemBuilder: (_, int index) {
                return headerItems[index].isButton != null
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        onTap: headerItems[index].onTap,
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
              },
              separatorBuilder: (_, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              //CarouselSection(),
              DownloadResumeSection(),
              SizedBox(
                height: 50.0,
              ),
              EducationSection(),
              SizedBox(
                height: 50.0,
              ),
              ExperienceSection(
                experiences: experiences,
              ),
              SizedBox(
                height: 50.0,
              ),
              SkillSection(),
              SizedBox(
                height: 50.0,
              ),
              TestimonialWidget(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
