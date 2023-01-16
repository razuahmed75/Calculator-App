import 'package:Calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/button_manager.dart';
import '../../utils/my_button.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final _value = Provider.of<ButtonController>(context, listen: false);
    return Expanded(
        flex: 2,
        child: Container(
          margin: EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          child: GridView.builder(
              itemCount: _value.buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (_, index) {
                // Clear button
                if (index == 0) {
                  return MyButton(
                    buttonTapped: () {
                      _value.clear();
                    },
                    text: _value.buttons[index],
                    textColor: AppColors.textColor,
                    backgroundColor: AppColors.clearColor.withOpacity(0.2),
                  );
                }

                // Delete button
                else if (index == 1) {
                  return MyButton(
                    buttonTapped: () {
                      _value.delete();
                    },
                    text: _value.buttons[index],
                    textColor: AppColors.textColor,
                    backgroundColor: AppColors.deleteColor.withOpacity(0.2),
                  );
                }

                // Equal button
                else if (index == _value.buttons.length - 1) {
                  return MyButton(
                    buttonTapped: () {
                      _value.equalPressed();
                    },
                    text: _value.buttons[index],
                    textColor: AppColors.textColor,
                    backgroundColor: AppColors.orangeColor.withOpacity(0.6),
                  );
                }

                // Answer button
                else if (index == _value.buttons.length - 2) {
                  return MyButton(
                    buttonTapped: () {
                      _value.equalPressed();
                    },
                    text: _value.buttons[index],
                    textColor: AppColors.textColor,
                    backgroundColor: AppColors.buttonColor,
                  );
                }

                // Rest of the buttons
                else {
                  return MyButton(
                    buttonTapped: () {
                      _value.addUserInput(index);
                    },
                    text: _value.buttons[index],
                    textColor: _value.isOperator(_value.buttons[index])
                        ? AppColors.orangeColor
                        : AppColors.textColor,
                    backgroundColor: _value.isOperator(_value.buttons[index])
                        ? AppColors.operatorColor
                        : AppColors.buttonColor,
                  );
                }
              }),
        ));
  }
}
