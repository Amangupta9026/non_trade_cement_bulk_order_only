import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:non_trade_cement_bulk_order_only/utils/colors.dart';

final homeNotifierProvider =
    AsyncNotifierProvider.autoDispose<HomeNotifier, HomeMode>(() {
  return HomeNotifier();
});

class HomeMode {
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;

  bool isHovered = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  bool isHovered4 = false;
  bool isHovered5 = false;
  bool isHovered6 = false;
  final hoverTransform = Matrix4.identity()..scale(1.04);

  final List<String> imgList = [
    'assets/images/p2.jpg',
    'assets/images/p4.jpg',
    'assets/images/p5.jpg',
    'assets/images/p6.jpg',
    'assets/images/image1.png',
  ];

  List genderList = [
    'UltraTech Cement',
    'Ambuja Cement',
    'ACC Cement',
    'Dalmia Cement',
    'JK Cement',
    'JSW Cement',
    'Shree Cement',
    'Orient Cement'
  ];
  String? selectedGender;
  String? newDropDownValue;

  bool isScrolling = false;
  bool isMenuVisible = false;

  TextEditingController? name = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? number = TextEditingController();
  TextEditingController? message = TextEditingController();
  TextEditingController? quantity = TextEditingController();

    TextEditingController? newsLater = TextEditingController();
}

class HomeNotifier extends AutoDisposeAsyncNotifier<HomeMode> {
  final HomeMode _depositMode = HomeMode();

  void isSelectedGender(String isValue) {
    _depositMode.selectedGender = isValue;
    state = AsyncData(_depositMode);
  }

  // Tab Selected
  void isSelected(bool isValue1, bool isValue2, bool isValue3, bool isValue4) {
    _depositMode.isSelected1 = isValue1;
    _depositMode.isSelected2 = isValue2;
    _depositMode.isSelected3 = isValue3;
    _depositMode.isSelected4 = isValue4;
    state = AsyncData(_depositMode);
  }

  void onEntered(bool isHovered) {
    _depositMode.isHovered = isHovered;
    _depositMode.isHovered2 = false;
    _depositMode.isHovered3 = false;
    _depositMode.isHovered4 = false;
    _depositMode.isHovered5 = false;
    _depositMode.isHovered6 = false;

    state = AsyncData(_depositMode);
  }

  void onEntered2(bool isHovered2) {
    _depositMode.isHovered2 = isHovered2;
    _depositMode.isHovered = false;
    _depositMode.isHovered3 = false;
    _depositMode.isHovered4 = false;
    _depositMode.isHovered5 = false;
    _depositMode.isHovered6 = false;
    state = AsyncData(_depositMode);
  }

  void onEntered3(bool isHovered3) {
    _depositMode.isHovered3 = isHovered3;
    _depositMode.isHovered2 = false;
    _depositMode.isHovered = false;
    _depositMode.isHovered4 = false;
    _depositMode.isHovered5 = false;
    _depositMode.isHovered6 = false;
    state = AsyncData(_depositMode);
  }

  void onEntered4(bool isHovered4) {
    _depositMode.isHovered4 = isHovered4;
    _depositMode.isHovered2 = false;
    _depositMode.isHovered3 = false;
    _depositMode.isHovered = false;
    _depositMode.isHovered5 = false;
    _depositMode.isHovered6 = false;
    state = AsyncData(_depositMode);
  }

  void onEntered5(bool isHovered5) {
    _depositMode.isHovered5 = isHovered5;
    _depositMode.isHovered2 = false;
    _depositMode.isHovered3 = false;
    _depositMode.isHovered4 = false;
    _depositMode.isHovered = false;
    _depositMode.isHovered6 = false;
    state = AsyncData(_depositMode);
  }

  void onEntered6(bool isHovered6) {
    _depositMode.isHovered6 = isHovered6;
    _depositMode.isHovered2 = false;
    _depositMode.isHovered3 = false;
    _depositMode.isHovered4 = false;
    _depositMode.isHovered5 = false;
    _depositMode.isHovered = false;
    state = AsyncData(_depositMode);
  }

  void scrollListener(bool value) {
    _depositMode.isScrolling = value;
    state = AsyncData(_depositMode);
  }

  // Mob Appbar Header

  void mobAppbarMenuVisible() {
    _depositMode.isMenuVisible = !_depositMode.isMenuVisible;
    state = AsyncData(_depositMode);
  }

  // post form
  void postform() {
    EasyLoading.show(status: 'loading...');
    if (_depositMode.name!.text.isNotEmpty &&
        _depositMode.email!.text.isNotEmpty &&
        _depositMode.number!.text.isNotEmpty &&
        _depositMode.quantity!.text.isNotEmpty &&
        _depositMode.message!.text.isNotEmpty &&
        _depositMode.selectedGender == null) {
      FirebaseFirestore.instance.collection('queryForm').add({
        "name": _depositMode.name?.text ?? '',
        "email": _depositMode.email?.text ?? '',
        "number": _depositMode.number?.text ?? '',
        "quantity": _depositMode.quantity?.text ?? '',
        "selected_company": _depositMode.newDropDownValue ?? '',
        "message": _depositMode.message?.text ?? '',
        "servertime": FieldValue.serverTimestamp()
      });
      EasyLoading.dismiss();
      toast("Sent Successfully");
      clearTextFields();
    } else {
      EasyLoading.dismiss();
      toast("Please fill all the fields");
    }
  }

  // newLater
  void newslater(){
    if(_depositMode.newsLater!.text.isEmpty){
       toast("Please fill the field");
    } else {
      toast("Added Successfully");
      clearTextFields();
    }
  }

  void clearTextFields() {
    _depositMode.name?.clear();
    _depositMode.email?.clear();
    _depositMode.number?.clear();
    _depositMode.quantity?.clear();
    _depositMode.message?.clear();
  }

  void toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  @override
  build() {
    return _depositMode;
  }
}
