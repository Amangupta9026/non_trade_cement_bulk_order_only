import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:non_trade_cement_bulk_order_only/riverpod/home_notfier.dart';
import 'package:non_trade_cement_bulk_order_only/router/routes_names.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refWatch = ref.watch(homeNotifierProvider);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          color: refWatch.value!.isScrolling == true
              ? Colors.white
              : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 20.0, right: 20, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.pushNamed(RouteNames.home);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home,
                          color: refWatch.value!.isScrolling == true
                              ? Colors.black
                              : Colors.white,
                          size: 40),
                      const SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Non Trade',
                            style: TextStyle(
                                fontSize: 18,
                                color: refWatch.value!.isScrolling == true
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 0.9),
                          ),
                          Text(
                            'Cement',
                            style: TextStyle(
                                fontSize: 14,
                                color: refWatch.value!.isScrolling == true
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNames.home);
                      },
                      child: Text('Home',
                          style: TextStyle(
                              color: refWatch.value!.isScrolling == true
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNames.about);
                      },
                      child: Text('About',
                          style: TextStyle(
                              color: refWatch.value!.isScrolling == true
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNames.services);
                      },
                      child: Text('Services',
                          style: TextStyle(
                              color: refWatch.value!.isScrolling == true
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNames.contact);
                      },
                      child: Text('Contact',
                          style: TextStyle(
                              color: refWatch.value!.isScrolling == true
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                    )
                  ],
                ),
                InkWell(
                  onTap: () async {
                    final call = Uri.parse('tel:+91 1234567890');
                    if (await canLaunchUrl(call)) {
                      launchUrl(call);
                    } else {
                      throw 'Could not launch $call';
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Call Now',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: refWatch.value!.isScrolling == true ? false : true,
          child: const Divider(
            color: Colors.white,
            thickness: 0.2,
          ),
        ),
      ],
    );
  }
}
