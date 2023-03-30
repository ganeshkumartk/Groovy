import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

/// Displays detailed information about a SampleItem.
class FitSetPwdScreenView extends StatefulWidget {
  const FitSetPwdScreenView({Key? key}) : super(key: key);

  static const routeName = 'fit_setpwd';

  @override
  State<FitSetPwdScreenView> createState() => _FitSetPwdScreenViewState();
}

class _FitSetPwdScreenViewState extends State<FitSetPwdScreenView> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 216, 223, 236), Colors.white],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 30, bottom: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 32,
                          color: Color(0xff061832),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xff061832),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        child: const Text(
                          'Need help?',
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 32, bottom: 20),
                  child: Text(
                    'Set Your Password.',
                    style: TextStyle(
                      color: Color(0xff061832),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 20),
                  child: Text(
                    "Protect your account with\nsecure password.",
                    style: TextStyle(
                      color: Color(0xff061832),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x144075cd),
                                  blurRadius: 20,
                                  offset: Offset(0, 20),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: TextField(
                              obscureText: !showPassword,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: !showPassword
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        )
                                      : const Icon(Icons.visibility,
                                          color: Color(0xff198FB3)),
                                ),
                                hintText: "Set new password",
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                height: 10,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xff198FB3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                height: 10,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xff198FB3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                height: 10,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                height: 10,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '• 8+ characters',
                                    style: TextStyle(
                                      color: Color(0xff198FB3),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '• 1 symbols',
                                    style: TextStyle(
                                      color: Color(0xff198FB3),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '• 1 uppercase',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '• 1 number',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 220,
                              height: 57,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x05000000),
                                    blurRadius: 2.21,
                                    offset: Offset(0, 2.77),
                                  ),
                                  BoxShadow(
                                    color: Color(0x07000000),
                                    blurRadius: 5.32,
                                    offset: Offset(0, 6.65),
                                  ),
                                  BoxShadow(
                                    color: Color(0x08000000),
                                    blurRadius: 10.02,
                                    offset: Offset(0, 12.52),
                                  ),
                                  BoxShadow(
                                    color: Color(0x0a000000),
                                    blurRadius: 17.87,
                                    offset: Offset(0, 22.34),
                                  ),
                                  BoxShadow(
                                    color: Color(0x0c000000),
                                    blurRadius: 33.42,
                                    offset: Offset(0, 41.78),
                                  ),
                                  BoxShadow(
                                    color: Color(0x11000000),
                                    blurRadius: 80,
                                    offset: Offset(0, 100),
                                  ),
                                ],
                                color: const Color(0xff198FB3),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 130,
                                    height: 27,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Continue',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          width: 12,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
