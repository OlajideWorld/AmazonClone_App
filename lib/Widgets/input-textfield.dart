import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final String? label;
  final bool obscureText;
  final String hintText;
  final int maxlines;
  final bool password;
  final TextEditingController? controller;
  final keyboardType;
  final bool textInputAction;

  const InputTextField(
      {Key? key,
      this.label,
      required this.hintText,
      required this.obscureText,
      this.textInputAction = false,
      this.controller,
      this.password = false,
      this.keyboardType,
      this.maxlines = 1})
      : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   widget.label!,
        //   style: const TextStyle(color: Colors.black),
        // ),
        // const SizedBox(
        //   height: 5,
        // ),
        TextFormField(
          maxLines: widget.maxlines,
          controller: widget.controller,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter ${widget.hintText}";
            }
            return null;
          },
          keyboardType: widget.keyboardType,
          textInputAction: !widget.textInputAction
              ? TextInputAction.next
              : TextInputAction.done,
          obscureText: widget.obscureText ? !_passwordVisible : false,
          decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.password
                  ? IconButton(
                      icon: Icon(_passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  : null,
              contentPadding: const EdgeInsets.only(top: 10, left: 10),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: GlobalVariables.unselectedNavBarColor),
              ),
              border: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: GlobalVariables.secondaryColor))),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
