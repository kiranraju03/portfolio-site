import 'package:enum_to_string/enum_to_string.dart';

class Experience {
  late String companyName;
  late Position designation;
  late String linkName;
  late PeriodSpan periodSpan;
  late List<Project> projects;

  Experience({
    required this.companyName,
    required this.designation,
    required this.linkName,
    required this.periodSpan,
    required this.projects,
  });

  Experience.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'] as String;
    designation = EnumToString.fromString(
      Position.values,
      json['designation'] as String,
    )!;
    linkName = json['linkName'] as String;
    periodSpan = PeriodSpan.fromJson(
      json['periodSpan'] as Map<String, dynamic>,
    );
    projects = (json['projects'] as List)
        .map(
          (e) => Project.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}

class Project {
  late String title;
  late List<String> description;
  late List<Skill> skillSets;

  Project({
    required this.title,
    required this.description,
    required this.skillSets,
  });

  Project.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    description = (json['description'] as String)
        .split(';')
        .map(
          (e) => e,
        )
        .toList();
    skillSets = (json['skill'] as List)
        .map((e) => EnumToString.fromString(
              Skill.values,
              e,
            ))
        .toList()
        .cast<Skill>();
  }
}

class PeriodSpan {
  late Period start;
  Period? end;

  PeriodSpan.fromJson(Map<String, dynamic> json) {
    start = Period.fromJson(
      json['start'] as Map<String, dynamic>,
    );
    end = json['end'] != null
        ? Period.fromJson(
            json['end'] as Map<String, dynamic>,
          )
        : null;
  }
}

class Period {
  late String month;
  late int year;

  Period({
    required this.month,
    required this.year,
  });

  Period.fromJson(Map<String, dynamic> json) {
    month = json['month'] as String;
    year = int.parse(json['year'].toString());
  }
}

enum Skill {
  FLUTTER,
  PYTHON,
}

Map<Skill, String> skillLinks = {
  Skill.FLUTTER: '',
  Skill.PYTHON: '',
};

enum Position {
  ASSOCIATE_SOFTWARE_ENGINEER,
  SOFTWARE_ENGINEER,
}

Map<Position, String> positionHumanise = {
  Position.ASSOCIATE_SOFTWARE_ENGINEER: 'Associate Software Engineer',
  Position.SOFTWARE_ENGINEER: 'Software Engineer',
};
