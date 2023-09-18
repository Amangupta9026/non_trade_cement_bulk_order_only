import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:non_trade_cement_bulk_order_only/riverpod/home_notfier.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileIndustriesWeServed extends ConsumerWidget {
  const MobileIndustriesWeServed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refWatch = ref.watch(homeNotifierProvider);
    final refRead = ref.read(homeNotifierProvider.notifier);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Industries we',
                  style: TextStyle(
                      color: Color.fromARGB(255, 64, 29, 29),
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              SizedBox(width: 6),
              Text('served',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ],
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text(
                'Industries, the countries they reside in, and the economies of those countries are interlinked in a complex web of interdependence.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18)),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              refRead.onEntered(true);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: refWatch.value!.isHovered
                      ? Colors.black.withOpacity(0.75)
                      : Colors.grey.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MdiIcons.lightbulbOn20,
                      color: refWatch.value!.isHovered
                          ? Colors.white
                          : Colors.black,
                      size: 30),
                  const SizedBox(height: 10),
                  Text('OPC 53 Grade Cement',
                      style: TextStyle(
                          color: refWatch.value!.isHovered
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                      'OPC 53 grade cement is a type of Ordinary Portland Cement that is used for specialized works.',
                      style: TextStyle(
                          color: refWatch.value!.isHovered
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final call = Uri.parse('tel:+91 1234567890');
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    },
                    child: Text(
                      'Call Now',
                      style: TextStyle(
                          color: refWatch.value!.isHovered
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              refRead.onEntered2(true);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: refWatch.value!.isHovered2
                      ? Colors.black.withOpacity(0.75)
                      : Colors.grey.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MdiIcons.lightbulbOn20,
                      color: refWatch.value!.isHovered2
                          ? Colors.white
                          : Colors.black,
                      size: 30),
                  const SizedBox(height: 10),
                  Text('OPC 43 Grade Cement',
                      style: TextStyle(
                          color: refWatch.value!.isHovered2
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                      'OPC 43 grade cement is used for general RCC construction where the grade of concrete is up to M30.',
                      style: TextStyle(
                          color: refWatch.value!.isHovered2
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final call = Uri.parse('tel:+91 1234567890');
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    },
                    child: Text(
                      'Call Now',
                      style: TextStyle(
                          color: refWatch.value!.isHovered2
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              refRead.onEntered3(true);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: refWatch.value!.isHovered3
                      ? Colors.black.withOpacity(0.75)
                      : Colors.grey.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MdiIcons.lightbulbOn20,
                      color: refWatch.value!.isHovered3
                          ? Colors.white
                          : Colors.black,
                      size: 30),
                  const SizedBox(height: 10),
                  Text('OPC 33 Grade Cement',
                      style: TextStyle(
                          color: refWatch.value!.isHovered3
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                      'OPC 33 grade cement is a type for general construction under normal environmental conditions.',
                      style: TextStyle(
                          color: refWatch.value!.isHovered3
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final call = Uri.parse('tel:+91 1234567890');
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    },
                    child: Text(
                      'Call Now',
                      style: TextStyle(
                          color: refWatch.value!.isHovered3
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              refRead.onEntered4(true);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: refWatch.value!.isHovered4
                      ? Colors.black.withOpacity(0.75)
                      : Colors.grey.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MdiIcons.lightbulbOn20,
                      color: refWatch.value!.isHovered4
                          ? Colors.white
                          : Colors.black,
                      size: 30),
                  const SizedBox(height: 10),
                  Text('PPC Cement',
                      style: TextStyle(
                          color: refWatch.value!.isHovered4
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                      'PPC cement stands for Portland Pozzolana Cement. It is a type of blended cement that is manufactured.',
                      style: TextStyle(
                          color: refWatch.value!.isHovered4
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final call = Uri.parse('tel:+91 1234567890');
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    },
                    child: Text(
                      'Call Now',
                      style: TextStyle(
                          color: refWatch.value!.isHovered4
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              refRead.onEntered5(true);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: refWatch.value!.isHovered5
                      ? Colors.black.withOpacity(0.75)
                      : Colors.grey.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MdiIcons.lightbulbOn20,
                      color: refWatch.value!.isHovered5
                          ? Colors.white
                          : Colors.black,
                      size: 30),
                  const SizedBox(height: 10),
                  Text('PSC Cement',
                      style: TextStyle(
                          color: refWatch.value!.isHovered5
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                      'PSC cement stands for Portland Slag Cement. It is used construction such as RCC works, precast concrete items.',
                      style: TextStyle(
                          color: refWatch.value!.isHovered5
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final call = Uri.parse('tel:+91 1234567890');
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    },
                    child: Text(
                      'Call Now',
                      style: TextStyle(
                          color: refWatch.value!.isHovered5
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
              onTap: () {
                refRead.onEntered6(true);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: refWatch.value!.isHovered6
                        ? Colors.black.withOpacity(0.75)
                        : Colors.grey.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(MdiIcons.lightbulbOn20,
                        color: refWatch.value!.isHovered6
                            ? Colors.white
                            : Colors.black,
                        size: 30),
                    const SizedBox(height: 10),
                    Text('Ready Mix Concrete',
                        style: TextStyle(
                            color: refWatch.value!.isHovered6
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    const SizedBox(height: 10),
                    Text(
                        'It is delivered to the work site in truck-mounted drums and is plastic and pliable when freshly mixed hardens',
                        style: TextStyle(
                            color: refWatch.value!.isHovered6
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                    const SizedBox(height: 20),
                    InkWell(
                        onTap: () async {
                          final call = Uri.parse('tel:+91 1234567890');
                          if (await canLaunchUrl(call)) {
                            launchUrl(call);
                          } else {
                            throw 'Could not launch $call';
                          }
                        },
                        child: Text('Call Now',
                            style: TextStyle(
                                color: refWatch.value!.isHovered6
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ))
        ]);
  }
}
