// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<HomeController, bool>(
        (controller) => controller.filterSelected == TaskFilterEnum.week,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'DIA DA SEMANA',
            style: context.titleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  // blurRadius: 1.0,
                  // spreadRadius: 1.0,
                ),
              ],
            ),
            height: 110,
            child: Selector<HomeController, DateTime>(
              selector: (context, controller) =>
                  controller.initialDateOfWeek ?? DateTime.now(),
              builder: (_, value, __) {
                return DatePicker(
                  value,
                  // DateTime.now(),
                  //locale: 'pt_BR',
                  //height: 1,
                  width: 69,
                  // initialSelectedDate: DateTime.now(),
                  initialSelectedDate: value,
                  selectionColor: context.primaryColor,
                  selectedTextColor: Colors.white,
                  daysCount: 30,
                  onDateChange: (date) {
                    context.read<HomeController>().filterByDay(date);
                  },
                  // monthTextStyle: TextStyle(color: Colors.orange),
                  // dayTextStyle: TextStyle(color: Colors.pink),
                  // dateTextStyle: TextStyle(color: Colors.greenAccent),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
