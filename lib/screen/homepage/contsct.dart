import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_trade_cement_bulk_order_only/riverpod/home_notfier.dart';
import 'package:non_trade_cement_bulk_order_only/utils/colors.dart';
import 'package:non_trade_cement_bulk_order_only/widget/appbar.dart';
import 'package:non_trade_cement_bulk_order_only/widget/footer.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_footer.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_appbar.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_subappbar.dart';
import 'package:non_trade_cement_bulk_order_only/widget/responsive_devices.dart';
import 'package:non_trade_cement_bulk_order_only/widget/sub_appbar_header.dart';
import 'package:non_trade_cement_bulk_order_only/widget/textformfield_widget.dart';

class Contact extends ConsumerWidget {
  const Contact({super.key});

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
                                const SubAppBarHeader(
                                  title: 'Contact',
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      30.0, 40, 30, 60),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Get in',
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    ' Touch',
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                'Cement House, 121, Ji Maharshi Karve Rd, Churchgate, Mumbai, Maharashtra- 400001',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                                height: 20),
                                                            Row(
                                                              children: [
                                                                Icon(Icons.call,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 30),
                                                                SizedBox(
                                                                    width: 5),
                                                                Text(
                                                                  'Call us on',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(width: 20),
                                                            Text(
                                                              'Phone: +91 00000000',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 30),
                                                    Column(
                                                      children: [
                                                        SizedBox(height: 20),
                                                        Row(
                                                          children: [
                                                            Icon(Icons.email,
                                                                color:
                                                                    Colors.red,
                                                                size: 30),
                                                            SizedBox(width: 5),
                                                            Text(
                                                              'Email us',
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(width: 20),
                                                        Text(
                                                          'support@nontrade.com',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 40),
                                                const CustomTextFormField(
                                                  hintText: 'Your name',
                                                ),
                                                const SizedBox(height: 10),
                                                const CustomTextFormField(
                                                  hintText: 'Your email',
                                                ),
                                                const SizedBox(height: 10),
                                                const CustomTextFormField(
                                                  hintText:
                                                      'Your mobile number',
                                                ),
                                                const SizedBox(height: 10),
                                                const CustomTextFormField(
                                                  hintText: 'Your message',
                                                  maxLines: 5,
                                                ),
                                                const SizedBox(height: 30),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Text(
                                                      'Submit',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Footer(),
                              ]),
                        )),
                        const Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: AppBarWidget()),
                      ],
                    ),
                  ),
                if (Responsive.isMobile(context) ||
                    Responsive.isTablet(context))
                  Expanded(
                    child: Stack(
                      children: [
                        SafeArea(
                            child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                   const MobSubAppBarHeader(title: 'Contact'),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 40, 20, 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Get in',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            ' Touch',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        'Cement House, 121, Ji Maharshi Karve Rd, Churchgate, Mumbai, Maharashtra- 400001',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 20),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Icon(Icons.call,
                                                color: Colors.red, size: 30),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Call us on',
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                              Text(
                                                'Phone: +91 00000000',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Icon(Icons.email,
                                                color: Colors.red, size: 30),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Email us',
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                              Text(
                                                'support@nontrade.com',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      const CustomTextFormField(
                                        hintText: 'Your name',
                                      ),
                                      const SizedBox(height: 10),
                                      const CustomTextFormField(
                                        hintText: 'Your email',
                                      ),
                                      const SizedBox(height: 10),
                                      const CustomTextFormField(
                                        hintText: 'Your mobile number',
                                      ),
                                      const SizedBox(height: 10),
                                      const CustomTextFormField(
                                        hintText: 'Your message',
                                        maxLines: 5,
                                      ),
                                      const SizedBox(height: 30),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            'Submit',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const MobFooter()
                              ]),
                        )),
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
        ));
  }
}
