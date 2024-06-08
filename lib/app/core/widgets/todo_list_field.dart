import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? sufixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  // ignore: use_super_parameters
  TodoListField({
    Key? key,
    required this.label,
    this.sufixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.focusNode,
  })  : assert(obscureText == true ? sufixIconButton == null : true,
            'nao posso receber nesta o obscure text preenchido e o sufix icon button'),
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 99, 99, 99),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red),
            ),
            isDense: true,
            // ignore: unnecessary_this
            suffixIcon: this.sufixIconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value = !obscureTextValue;
                        },
                        icon: Icon(
                          !obscureTextValue
                              ? TodoListIcons.eye_slash
                              : TodoListIcons.eye,
                          size: 15,
                        ),
                      )
                    : null),
          ),
          obscureText: obscureTextValue,
          //obscuringCharacter:'',
        );
      },
    );
  }
}
