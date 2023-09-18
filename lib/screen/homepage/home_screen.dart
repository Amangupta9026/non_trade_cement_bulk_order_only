import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_trade_cement_bulk_order_only/riverpod/home_notfier.dart';
import 'package:non_trade_cement_bulk_order_only/utils/colors.dart';
import 'package:non_trade_cement_bulk_order_only/widget/appbar.dart';
import 'package:non_trade_cement_bulk_order_only/widget/footer.dart';
import 'package:non_trade_cement_bulk_order_only/widget/industries_we_serve.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_appbar.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_footer.dart';
import 'package:non_trade_cement_bulk_order_only/widget/mob_indutries_we_serve.dart';
import 'package:non_trade_cement_bulk_order_only/widget/responsive_devices.dart';
import 'package:non_trade_cement_bulk_order_only/widget/textformfield_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refWatch = ref.watch(homeNotifierProvider);
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
                              Stack(children: [
                                CarouselSlider(
                                    items: refWatch.value?.imgList
                                        .map((item) => Image.asset(
                                              item,
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.9,
                                              fit: BoxFit.cover,
                                              color: Colors.black54,
                                              colorBlendMode: BlendMode.darken,
                                            ))
                                        .toList(),
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        viewportFraction: 1,
                                        aspectRatio: double.infinity)),
                                Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.3,
                                    left: 50,
                                    right: 0,
                                    bottom: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(children: [
                                          Text('Non Trade Cement',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40)),
                                          Text(' Booking',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40))
                                        ]),
                                        const SizedBox(height: 20),
                                        const Text(
                                            'Non-trade cement is the cement that is sold straight from the factory to the end user.',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      20, 10, 20, 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.red),
                                              child: const Text('Call Now',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24)),
                                            ))
                                      ],
                                    )),
                              ]),
                              const SizedBox(height: 40),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50.0, 0, 50, 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text('Request a',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30)),
                                        Text(' Call Back',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30))
                                      ],
                                    ),

                                    const SizedBox(height: 5),
                                    const Text(
                                        'Fill all information details to consult with us to get sevices from us',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                    const SizedBox(height: 20),
                                    // Text Form Field
                                    const CustomTextFormField(
                                      hintText: 'Enter your name',
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomTextFormField(
                                      hintText: 'Enter your email id',
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomTextFormField(
                                      hintText: 'Enter your phone number',
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomTextFormField(
                                      hintText: 'Enter your message',
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomTextFormField(
                                      hintText: 'Enter your quantity',
                                      keyboardType: TextInputType.number,
                                    ),
                                    const SizedBox(height: 25),
                                    DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: refWatch.value?.selectedGender == null
                                                      ? Colors.grey
                                                      : Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color:
                                                      refWatch.value?.selectedGender == null
                                                          ? Colors.white
                                                          : Colors.grey)),
                                          disabledBorder: InputBorder.none,
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color:
                                                      refWatch.value?.selectedGender == null
                                                          ? Colors.white
                                                          : Colors.grey))),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      elevation: 1,
                                      hint: const Text('Select Company'),
                                      //    isDense: true,
                                      borderRadius: BorderRadius.circular(10),
                                      isExpanded: true,
                                      value: refWatch.value?.selectedGender,
                                      onChanged: (newValue) {},
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'UltraTech',
                                          child: Text('UltraTech Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Ambuja',
                                          child: Text('Ambuja Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'ACC',
                                          child: Text('ACC Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Dalmia',
                                          child: Text('Dalmia Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'JK',
                                          child: Text('JK Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'JSW',
                                          child: Text('JSW Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Shree',
                                          child: Text('Shree Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Orient',
                                          child: Text('Orient Cement'),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    // Button
                                    Container(
                                        width: double.infinity,
                                        height: 52,
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Get a Call Back',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        )),

                                    const SizedBox(height: 60),
                                    const IndustriesWeServed(),
                                    const SizedBox(height: 60),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/images/about.jpg',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.31,
                                            fit: BoxFit.cover),
                                        const SizedBox(width: 30),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'ABOUT US',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(height: 10),
                                              const Wrap(
                                                children: [
                                                  Text(
                                                    'A Cement Industrious',
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(width: 6),
                                                  Text(
                                                    'For Your Dream Home',
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                  'Non-trade cement is the cement that is sold straight from the factory to the end user. These end users are often high-end construction firms with large building projects. Builders, contractors, or institutes participating in any project, NGO, or government are all entitled to purchase non-trade cement.',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black)),
                                              const SizedBox(height: 30),
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        40, 10, 40, 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: const Text('Call Us Now',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 70),

                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Projects for',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ' Inspirations',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 60.0, right: 60),
                                        child: Text(
                                            'Non-trade cement is significantly less expensive due to massive cement volumes; any additional costs are minimal in contrast; yet, Non-trade cement has exorbitant minimum order amounts.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                      ),
                                    ),

                                    const SizedBox(height: 50),
                                    // Projects 1
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12),
                                      child: Row(children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              refRead.isSelected(
                                                  true, false, false, false);
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 2,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    color: refWatch.value
                                                                ?.isSelected1 ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.grey
                                                            .withOpacity(0.4)),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'Projects 1',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: refWatch.value
                                                                  ?.isSelected1 ==
                                                              true
                                                          ? Colors.red
                                                          : Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              refRead.isSelected(
                                                  false, true, false, false);
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 2,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    color: refWatch.value
                                                                ?.isSelected2 ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.grey
                                                            .withOpacity(0.4)),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'Projects 2',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: refWatch.value
                                                                  ?.isSelected2 ==
                                                              true
                                                          ? Colors.red
                                                          : Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              refRead.isSelected(
                                                  false, false, true, false);
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 2,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    color: refWatch.value
                                                                ?.isSelected3 ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.grey
                                                            .withOpacity(0.4)),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'Projects 3',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: refWatch.value
                                                                  ?.isSelected3 ==
                                                              true
                                                          ? Colors.red
                                                          : Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              refRead.isSelected(
                                                  false, false, false, true);
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 2,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    color: refWatch.value
                                                                ?.isSelected4 ==
                                                            true
                                                        ? Colors.red
                                                        : Colors.grey
                                                            .withOpacity(0.4)),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'Projects 4',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: refWatch.value
                                                                  ?.isSelected4 ==
                                                              true
                                                          ? Colors.red
                                                          : Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    const SizedBox(height: 60),
                                    Visibility(
                                      visible:
                                          refWatch.value?.isSelected1 == true,
                                      child: Column(
                                        children: [
                                          Wrap(
                                            runSpacing: 20,
                                            spacing: 40,
                                            children: [
                                              Image.asset(
                                                  'assets/images/about.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p2.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p3.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p4.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/about2.png',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p5.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p6.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                    // Project 2
                                    Visibility(
                                      visible:
                                          refWatch.value?.isSelected2 == true,
                                      child: Column(
                                        children: [
                                          Wrap(
                                            runSpacing: 20,
                                            spacing: 40,
                                            children: [
                                              Image.asset(
                                                  'assets/images/p5.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p6.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/about2.png',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p1.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/about.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p2.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                    // Project 3
                                    Visibility(
                                      visible:
                                          refWatch.value?.isSelected3 == true,
                                      child: Column(
                                        children: [
                                          Wrap(
                                            runSpacing: 20,
                                            spacing: 40,
                                            children: [
                                              Image.asset(
                                                  'assets/images/about.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p4.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p5.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p2.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p1.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                    // Project 4
                                    Visibility(
                                      visible:
                                          refWatch.value?.isSelected4 == true,
                                      child: Column(
                                        children: [
                                          Wrap(
                                            runSpacing: 20,
                                            spacing: 40,
                                            children: [
                                              Image.asset(
                                                  'assets/images/about2.png',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/about.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p1.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p2.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                              Image.asset(
                                                  'assets/images/p5.jpg',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  fit: BoxFit.cover),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 100),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.07),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.construction,
                                                      color: Colors.red,
                                                      size: 30),
                                                  SizedBox(width: 15),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Creative Ideas',
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          'Sed quia non numquam eius ut modi tempora ut labore.',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.build,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 15),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Super Safety',
                                                            style: TextStyle(
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          'Sed quia non numquam eius ut modi tempora ut labore.',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF3B3663),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.handyman,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 15),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '24/7 Support',
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          'Sed quia non numquam eius ut modi tempora ut labore.',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),

                                    // Footer
                                    const SizedBox(height: 60),
                                  ],
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
                              Stack(children: [
                                CarouselSlider(
                                    items: refWatch.value?.imgList
                                        .map((item) => Image.asset(
                                              item,
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              fit: BoxFit.cover,
                                              color: Colors.black54,
                                              colorBlendMode: BlendMode.darken,
                                            ))
                                        .toList(),
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        viewportFraction: 1,
                                        aspectRatio: double.infinity)),
                                Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.15,
                                    left: 20,
                                    right: 10,
                                    bottom: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(children: [
                                          Text('Non Trade Cement',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24)),
                                          Text(' Booking',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24))
                                        ]),
                                        const SizedBox(height: 20),
                                        const Text(
                                            'Non-trade cement is the cement that is sold straight from the factory to the end user.',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      20, 10, 20, 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.red),
                                              child: const Text('Call Now',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                            ))
                                      ],
                                    )),
                              ]),
                              const SizedBox(height: 30),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 20, 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text('Request a',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24)),
                                        Text(' Call Back',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24))
                                      ],
                                    ),

                                    const SizedBox(height: 5),
                                    const Text(
                                        'Fill all information details to consult with us to get sevices from us',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                    const SizedBox(height: 20),
                                    // Text Form Field
                                    const CustomTextFormField(
                                      hintText: 'Enter your name',
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomTextFormField(
                                      hintText: 'Enter your email id',
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomTextFormField(
                                      hintText: 'Enter your phone number',
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomTextFormField(
                                      hintText: 'Enter your message',
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomTextFormField(
                                      hintText: 'Enter your quantity',
                                      keyboardType: TextInputType.number,
                                    ),
                                    const SizedBox(height: 25),
                                    DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: refWatch.value?.selectedGender == null
                                                      ? Colors.grey
                                                      : Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color:
                                                      refWatch.value?.selectedGender == null
                                                          ? Colors.white
                                                          : Colors.grey)),
                                          disabledBorder: InputBorder.none,
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color:
                                                      refWatch.value?.selectedGender == null
                                                          ? Colors.white
                                                          : Colors.grey))),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      elevation: 1,
                                      hint: const Text('Select Company'),
                                      //    isDense: true,
                                      borderRadius: BorderRadius.circular(10),
                                      isExpanded: true,
                                      value: refWatch.value?.selectedGender,
                                      onChanged: (newValue) {},
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'UltraTech',
                                          child: Text('UltraTech Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Ambuja',
                                          child: Text('Ambuja Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'ACC',
                                          child: Text('ACC Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Dalmia',
                                          child: Text('Dalmia Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'JK',
                                          child: Text('JK Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'JSW',
                                          child: Text('JSW Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Shree',
                                          child: Text('Shree Cement'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Orient',
                                          child: Text('Orient Cement'),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    // Button
                                    Container(
                                        width: double.infinity,
                                        height: 52,
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Get a Call Back',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        )),

                                    const SizedBox(height: 50),
                                    const MobileIndustriesWeServed(),
                                    const SizedBox(height: 50),
                                    Image.asset('assets/images/about.jpg',
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.31,
                                        fit: BoxFit.cover),
                                    const SizedBox(height: 30),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'ABOUT US',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'A Cement Industrious ',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        const Text(
                                          'For Your Dream Home',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                            'Non-trade cement is the cement that is sold straight from the factory to the end user. These end users are often high-end construction firms with large building projects. Builders, contractors, or institutes participating in any project, NGO, or government are all entitled to purchase non-trade cement.',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                        const SizedBox(height: 30),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Text('Call Us Now',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 50),

                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Projects for',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ' Inspirations',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    const Text(
                                        'Non-trade cement is significantly less expensive due to massive cement volumes; any additional costs are minimal in contrast; yet, Non-trade cement has exorbitant minimum order amounts.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),

                                    const SizedBox(height: 50),
                                    // Projects 1

                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          color: Colors.grey.withOpacity(0.07)),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              refRead.isSelected(
                                                  true, false, false, false);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Project One',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Icon(
                                                    refWatch.value
                                                                ?.isSelected1 ==
                                                            true
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    size: 36,
                                                    color: Colors.grey
                                                        .withOpacity(0.6))
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Visibility(
                                            visible:
                                                refWatch.value?.isSelected1 ==
                                                    true,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/about.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p2.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p3.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p4.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/about2.png',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p5.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p6.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Project 2
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          color: Colors.grey.withOpacity(0.07)),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              refRead.isSelected(
                                                  false, true, false, false);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Project Two',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Icon(
                                                    refWatch.value
                                                                ?.isSelected2 ==
                                                            true
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    size: 36,
                                                    color: Colors.grey
                                                        .withOpacity(0.6))
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                refWatch.value?.isSelected2 ==
                                                    true,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/p5.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p6.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/about2.png',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p1.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/about.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p2.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Project 3
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          color: Colors.grey.withOpacity(0.07)),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              refRead.isSelected(
                                                  false, false, true, false);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Project Three',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Icon(
                                                    refWatch.value
                                                                ?.isSelected3 ==
                                                            true
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    size: 36,
                                                    color: Colors.grey
                                                        .withOpacity(0.6))
                                              ],
                                            ),
                                          ),

                                          // Project 3
                                          Visibility(
                                            visible:
                                                refWatch.value?.isSelected3 ==
                                                    true,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/about.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p4.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p5.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p2.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p1.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          color: Colors.grey.withOpacity(0.07)),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              refRead.isSelected(
                                                  false, false, false, true);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Project Four',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Icon(
                                                    refWatch.value
                                                                ?.isSelected4 ==
                                                            true
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    size: 36,
                                                    color: Colors.grey
                                                        .withOpacity(0.6))
                                              ],
                                            ),
                                          ),
                                          // Project 4
                                          Visibility(
                                            visible:
                                                refWatch.value?.isSelected4 ==
                                                    true,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/about2.png',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/about.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p1.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p2.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover),
                                                  const SizedBox(height: 30),
                                                  Image.asset(
                                                      'assets/images/p5.jpg',
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      fit: BoxFit.cover)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 60),

                                    Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.grey.withOpacity(0.07),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.construction,
                                                color: Colors.red, size: 30),
                                            SizedBox(width: 15),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Creative Ideas',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Sed quia non numquam eius ut modi tempora ut labore.',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(height: 20),
                                    Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.build,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 15),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text('Super Safety',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Sed quia non numquam eius ut modi tempora ut labore.',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(height: 20),
                                    Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF3B3663),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.handyman,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 15),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '24/7 Support',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Sed quia non numquam eius ut modi tempora ut labore.',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),

                                    // Footer
                                    const SizedBox(height: 30),
                                  ],
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
