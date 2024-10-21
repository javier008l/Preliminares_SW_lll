import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBox extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  TextBox(this._controller, this._label,
    {this.keyboardType = TextInputType.text,
    this.inputFormatters});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: _controller,
        keyboardType: keyboardType, 
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            filled: true,
            labelText: _label,
            suffix: GestureDetector(
              child: const Icon(Icons.close),
              onTap: () {
                _controller.clear();
              },
            )),
      ),
    );
  }
}