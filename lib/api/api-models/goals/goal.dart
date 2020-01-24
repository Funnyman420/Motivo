import 'package:json_annotation/json_annotation.dart';
part 'goal.g.dart';

@JsonSerializable()
class Goal {
  int goalId;
  String title;
  int numericCurrent;
  int numericGoal;


  Goal(
      {this.goalId,
      this.title,
      this.numericCurrent,
      this.numericGoal,
   });

  factory Goal.fromJson(Map<String, dynamic> json) =>
      _$GoalFromJson(json);

  Map <String, dynamic> toJson() => _$GoalToJson(this);

  @override
  bool operator ==(Object other) =>
      other is Goal &&
      other.goalId == goalId &&
      other.title == title &&

      other.numericCurrent == numericCurrent &&
      other.numericGoal == numericGoal;

  int get hashCode =>
      this.goalId.hashCode * 31 ^
      this.title.hashCode ^
      this.numericCurrent.hashCode ^
      this.numericGoal.hashCode;
}
