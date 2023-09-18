import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:non_trade_cement_bulk_order_only/riverpod/home_notfier.dart';
import 'package:non_trade_cement_bulk_order_only/router/routes_names.dart';

class MobAppHeader extends ConsumerWidget {
  const MobAppHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refWatch = ref.watch(homeNotifierProvider);
    final refRead = ref.read(homeNotifierProvider.notifier);
    return Stack(
      children: [
        Column(
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
                    InkWell(
                      onTap: () {
                        refRead.mobAppbarMenuVisible();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Icon(
                                  refWatch.value!.isMenuVisible == false
                                      ? Icons.menu
                                      : Icons.close,
                                  color: Colors.white,
                                  size: 20))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: refWatch.value!.isMenuVisible == true,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    context.pushNamed(RouteNames.home);
                    refRead.mobAppbarMenuVisible();
                  },
                  child: const Text(
                    'Home',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    context.pushNamed(RouteNames.about);
                    refRead.mobAppbarMenuVisible();
                  },
                  child: const Text(
                    'About Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    context.pushNamed(RouteNames.services);
                    refRead.mobAppbarMenuVisible();
                  },
                  child: const Text(
                    'Services',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    context.pushNamed(RouteNames.contact);
                    refRead.mobAppbarMenuVisible();
                  },
                  child: const Text(
                    'Contact Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
