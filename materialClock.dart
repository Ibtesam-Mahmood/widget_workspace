import 'package:flutter/material.dart';
import 'dart:async';

class MaterialClock extends StatefulWidget {
  TimeOfDay time = TimeOfDay.now();
  @override
  _MaterialClockState createState() => _MaterialClockState();
}

class _MaterialClockState extends State<MaterialClock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        color: Colors.black,
        height: 100,
        minWidth: 100,
        onPressed: () => {_selectTime(context)},
      ),
    );
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: widget.time);
    if (picked != null && picked != TimeOfDay.now()) {
      print('Time Selected: ${widget.time.toString()}');
      setState(() {
        widget.time = picked;
      });
    }
  }
}
