// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return Goal(
    goalId: json['goalId'] as int,
    title: json['title'] as String,
    numericCurrent: json['numericCurrent'] as int,
    numericGoal: json['numericGoal'] as int,
  );
}

Map<String, dynamic> _$GoalToJson(Goal instance) => <String, dynamic>{
      'goalId': instance.goalId,
      'title': instance.title,
      'numericCurrent': instance.numericCurrent,
      'numericGoal': instance.numericGoal,
    };
