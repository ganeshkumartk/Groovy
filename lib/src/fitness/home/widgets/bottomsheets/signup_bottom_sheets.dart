import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../groovy_dashboard_screen.dart';
import '../buttons/floating_done_button.dart';
import 'bottomsheet_header.dart';

class SignUpBottomModalScreen extends StatefulWidget {
  const SignUpBottomModalScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpBottomModalScreen> createState() =>
      _SignUpBottomModalScreenState();
}

class _SignUpBottomModalScreenState extends State<SignUpBottomModalScreen> {
  late FocusNode emailFocusNode;
  bool emailchar = false;
  final _emailController = TextEditingController();

  Widget emailTextField() {
    return StreamBuilder<String>(
      builder: (context, snapshot) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            autocorrect: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter e-mail to continue';
              } else if (!(emailchar) && value.isNotEmpty) {
                return "Invalid Email";
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.only(end: 2.0),
                child: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
              focusColor: Colors.black,
              hintText: 'Enter E-mail . . .',
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              fillColor: Colors.white,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            maxLines: 1,
            cursorColor: Colors.black,
            style: const TextStyle(
              fontSize: 22,
            ),
            enableInteractiveSelection: true,
            focusNode: emailFocusNode,
            textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    _emailController.addListener(() {
      if (mounted) {
        setState(() {
          emailchar = _emailController.text.contains(
              RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'),
              0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffF5F0E7),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignUpBottomSheetHeader(label: 'Continue to Groovy!'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '[Experimental], by proceeding you agree to the Terms & Conditions',
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 160,
                  child: FloatingDoneButton(
                    angle: 5,
                    label: 'Continue',
                    icon:
                        const AssetImage('assets/images/icons/24x24/check.png'),
                    onPressed: () {
                      Navigator.restorablePushNamed(
                        context,
                        GroovyDashboardScreenView.routeName,
                      );
                    },
                    bgColor: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

}
