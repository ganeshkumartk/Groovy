import 'package:flutter/material.dart';
import '../buttons/scale_button.dart';

class BottomSheetHeader extends StatelessWidget {
  final String label;

  const BottomSheetHeader({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 16.0,
          right: 16.0,
          bottom: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(label,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                )),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.cancel,
                size: 36,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class SignUpBottomSheetHeader extends StatelessWidget {
  final String label;

  const SignUpBottomSheetHeader({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 16.0,
          right: 16.0,
          bottom: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(label, style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),),
            ScaleButton(
              label: 'Close',
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: const Color(0x1a252526),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Image(
                  image: AssetImage('assets/images/icons/24x24/cross.png'),
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}