import 'package:Calculator/models/button_manager.dart';
import 'package:Calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final _value = Provider.of<ButtonController>(context, listen: true);

    return Expanded(
        flex: 1,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Text(
                  _value.userQuestion,
                  style: TextStyle(fontSize: 20, color: AppColors.textColor),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(20),
                child: Text(
                  _value.userAnswer,
                  style: TextStyle(
                      fontSize: _value.textSize, color: AppColors.orangeColor),
                ),
              ),
            ],
          ),
        ));
  }
}
