import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class FitMainScreenView extends StatefulWidget {
  const FitMainScreenView({Key? key}) : super(key: key);

  static const routeName = 'fit_main';

  @override
  State<FitMainScreenView> createState() => _FitMainScreenViewState();
}

class _FitMainScreenViewState extends State<FitMainScreenView> {
  bool freeTrial = true;
  bool monthly = false;
  bool annual = false;
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
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 32,
                          color: Color(0xff061832),
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      const Center(
                        child: Text(
                          'Subscriptions',
                          style: TextStyle(
                            color: Color(0xff061832),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 24, bottom: 20),
                  child: Text(
                    'Go Pro!',
                    style: TextStyle(
                      color: Color(0xff061832),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 24, bottom: 20),
                  child: Text(
                    '- Unlimited Workouts\n- Video Guides\n- Personal Plan',
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
                        InkWell(
                          onTap: () {
                            setState(() {
                              freeTrial = !freeTrial;
                              monthly = annual = false;
                            });
                          },
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                side: BorderSide(
                                    width: 2,
                                    color: freeTrial
                                        ? const Color(0xFF198FB3)
                                        : const Color(0xfff4f6fa))),
                            child: Container(
                              height: 100,
                              width: 350,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff4f6fa),
                              ),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: freeTrial,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.price_check_outlined,
                                          color: Color(0xFF198FB3), size: 48),
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Free Trial',
                                        style: TextStyle(
                                          color: Color(0xff061832),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '14 free days',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              monthly = !monthly;
                              freeTrial = annual = false;
                            });
                          },
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                side: BorderSide(
                                    width: 2,
                                    color: monthly
                                        ? const Color(0xFF198FB3)
                                        : const Color(0xfff4f6fa))),
                            child: Container(
                              height: 100,
                              width: 350,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff4f6fa),
                              ),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: monthly,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.price_check_outlined,
                                          color: Color(0xFF198FB3), size: 48),
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Monthly',
                                        style: TextStyle(
                                          color: Color(0xff061832),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Rs. 449 billed monthly',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              annual = !annual;
                              monthly = freeTrial = false;
                            });
                          },
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                side: BorderSide(
                                    width: 2,
                                    color: annual
                                        ? const Color(0xFF198FB3)
                                        : const Color(0xfff4f6fa))),
                            child: Container(
                              height: 100,
                              width: 350,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff4f6fa),
                              ),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: annual,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.price_check_outlined,
                                          color: Color(0xFF198FB3), size: 48),
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Annual',
                                        style: TextStyle(
                                          color: Color(0xff061832),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Rs. 949 billed once',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Choose',
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
                                  borderRadius: BorderRadius.circular(8),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
