import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_trade_cement_bulk_order_only/router/routes_names.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 50, 40, 50),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.07),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Company',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNames.home);
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNames.about);
                      },
                      child: const Text(
                        'About us',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNames.services);
                      },
                      child: const Text(
                        'Our Services',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNames.contact);
                      },
                      child: const Text(
                        'Contact Us',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  children: [
                    Text(
                      'Our Services',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'OPC 53 Grade Cement',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'OPC 43 Grade Cement',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'OPC 33 Grade Cement',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'PPC & PSC Grade Cement',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Column(children: [
              //     const Text(
              //       'Newsletter',
              //       style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.black),
              //     ),
              //     const SizedBox(height: 10),
              //     Container(
              //       padding: const EdgeInsets.all(20),
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Column(
              //         children: [
              //           const Text('Get latest updates',
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w500,
              //                   color: Colors.black)),
              //           const SizedBox(height: 10),
              //           Consumer(builder: (context, ref, child) {
              //             final refRead =
              //                 ref.read(homeNotifierProvider.notifier);
              //             final refWatch = ref.watch(homeNotifierProvider);
              //             return CustomTextFormField(
              //               hintText: 'Enter your email id',
              //               controller: refWatch.value?.newsLater,
              //               suffixIcon: InkWell(
              //                 onTap: () {
              //                   refRead.newslater();
              //                 },
              //                 child: const Icon(
              //                   Icons.send,
              //                   color: Colors.red,
              //                 ),
              //               ),
              //             );
              //           }),
              //         ],
              //       ),
              //     )
              //   ]),
              // )
            ],
          ),
          const SizedBox(height: 50),
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 50),
          const Text(
            '© 2023 Non Trade Cement. All rights reserved. Design by Non Trade Cement',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
