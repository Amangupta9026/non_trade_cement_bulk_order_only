import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_trade_cement_bulk_order_only/riverpod/home_notfier.dart';
import 'package:non_trade_cement_bulk_order_only/utils/colors.dart';
import 'package:non_trade_cement_bulk_order_only/widget/appbar.dart';
import 'package:non_trade_cement_bulk_order_only/widget/footer.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_appbar.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_footer.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_subappbar.dart';
import 'package:non_trade_cement_bulk_order_only/widget/responsive_devices.dart';
import 'package:non_trade_cement_bulk_order_only/widget/sub_appbar_header.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends ConsumerWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refRead = ref.read(homeNotifierProvider.notifier);
    return Scaffold(
      backgroundColor: whiteBackgroundColor,
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            // Scroll down color change
            if (notification.metrics.pixels > 00 &&
                notification.metrics.pixels < 92000) {
              refRead.scrollListener(true);
            } else {
              refRead.scrollListener(false);
            }

            return true;
          }
          return false;
        },
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.unknown,
              PointerDeviceKind.invertedStylus,
              PointerDeviceKind.stylus
            },
          ),
          child: Column(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: Stack(
                    children: [
                      SafeArea(
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SubAppBarHeader(title: 'About Us'),

                              // About us
                              const SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'About Us',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              const Wrap(
                                                children: [
                                                  Text(
                                                    'A Cement Industrious',
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    ' For Your Dream Home',
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              const Text(
                                                'Non-trade cement is the cement that is sold straight from the factory to the end user. These end users are often high-end construction firms with large building projects. Builders, contractors, or institutes participating in any project, NGO, or government are all entitled to purchase non-trade cement.',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(height: 40),
                                              InkWell(
                                            onTap: () async {
                                              final call = Uri.parse(
                                                  'tel:+91 1234567890');
                                              if (await canLaunchUrl(call)) {
                                                launchUrl(call);
                                              } else {
                                                throw 'Could not launch $call';
                                              }
                                            },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  child: const Text(
                                                    'Call Now',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.asset(
                                                'assets/images/about.jpg',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 70),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 40, bottom: 60),
                                color: Colors.grey.withOpacity(0.07),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'FEW WORDS',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Text('Non Trade Cement: Benefits',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: Colors.red,
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Flexible(
                                                  child: Text(
                                                    'Lower cost: Non-trade cement is often less expensive than �trade� cement, making it an appealing alternative for projects with limited budgets',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: Colors.red,
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Flexible(
                                                  child: Text(
                                                    'Non-trade cement has a wide range of uses, including infrastructure projects, agricultural projects, do-it-yourself projects, and industrial applications.',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: Colors.red,
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Flexible(
                                                  child: Text(
                                                    'Simpler to work with: Non-trade cement is often easier to deal with than regular �trade� cement, which, because of its great strength and stiffness, may be difficult to handle and work with.',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: Colors.red,
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Flexible(
                                                  child: Text(
                                                    'Our Employee Growth Measuring Performance.',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                              'assets/images/about2.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Footer(),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: AppBarWidget()),
                    ],
                  ),
                ),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                Expanded(
                  child: Stack(
                    children: [
                      SafeArea(
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MobSubAppBarHeader(title: 'About Us'),

                              // About us
                              const SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'About Us',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        const Wrap(
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          children: [
                                            Text(
                                              'A Cement Industrious ',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              'For Your Dream Home',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          'Non-trade cement is the cement that is sold straight from the factory to the end user. These end users are often high-end construction firms with large building projects. Builders, contractors, or institutes participating in any project, NGO, or government are all entitled to purchase non-trade cement.',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 30),
                                        InkWell(
                                            onTap: () async {
                                              final call = Uri.parse(
                                                  'tel:+91 1234567890');
                                              if (await canLaunchUrl(call)) {
                                                launchUrl(call);
                                              } else {
                                                throw 'Could not launch $call';
                                              }
                                            },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Text(
                                              'Call Now',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                          'assets/images/about.jpg',
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          fit: BoxFit.cover),
                                    ),
                                    const SizedBox(height: 50),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 40, bottom: 40),
                                color: Colors.grey.withOpacity(0.07),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20),
                                  child: Column(
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'FEW WORDS',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text('Non Trade Cement: Benefits',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.red,
                                                  size: 16,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  'Lower cost: Non-trade cement is often less expensive than �trade� cement, making it an appealing alternative for projects with limited budgets',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.red,
                                                  size: 16,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  'Non-trade cement has a wide range of uses, including infrastructure projects, agricultural projects, do-it-yourself projects, and industrial applications.',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.red,
                                                  size: 16,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  'Simpler to work with: Non-trade cement is often easier to deal with than regular �trade� cement, which, because of its great strength and stiffness, may be difficult to handle and work with.',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.red,
                                                  size: 16,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  'Our Employee Growth Measuring Performance.',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                            'assets/images/about2.png',
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            fit: BoxFit.cover),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const MobFooter(),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: MobAppHeader()),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
