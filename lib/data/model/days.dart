import 'package:equatable/equatable.dart';

class DayInWeek extends Equatable {
  final String dayName;
  const DayInWeek({
    required this.dayName,
  });

  @override
  List<Object> get props => [
        dayName,
      ];
}
