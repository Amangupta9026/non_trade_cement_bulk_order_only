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
import 'package:non_trade_cement_bulk_order_only/widget/sub_appbar_header.dart';

import '../../widget/mob_indutries_we_serve.dart';
import '../../widget/responsive_devices.dart';

class Services extends ConsumerWidget {
  const Services({super.key});

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
                const Expanded(
                  child: Stack(
                    children: [
                      SafeArea(
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubAppBarHeader(title: 'Services'),
                              Padding(
                                padding: EdgeInsets.fromLTRB(30.0, 40, 30, 60),
                                child: IndustriesWeServed(),
                              ),
                              Footer(),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: AppBarWidget()),
                    ],
                  ),
                ),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                const Expanded(
                  child: Stack(
                    children: [
                      SafeArea(
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              SubAppBarHeader(title: 'Services'),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20.0, 40, 20, 30),
                                child: MobileIndustriesWeServed(),
                              ),
                              MobFooter(),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
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
