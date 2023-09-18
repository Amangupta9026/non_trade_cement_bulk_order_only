import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_trade_cement_bulk_order_only/router/routes_names.dart';

class MobSubAppBarHeader extends StatelessWidget {
  final String? title;
  const MobSubAppBarHeader({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/p4.jpg',
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.cover,
          color: Colors.black54,
          colorBlendMode: BlendMode.darken,
        ),
        Center(
          child: Positioned(
            top: 150,
            left: 20,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                children: [
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pushNamed(RouteNames.home);
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
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward,
                            color: Colors.white, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          title ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
    );
  }
}
