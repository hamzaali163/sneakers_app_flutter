import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/utils/general_utils.dart';
import 'package:flutter/material.dart';

class RoundButtonOne extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  const RoundButtonOne({super.key, required this.onpress, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 335,
        decoration: const BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: GeneralUtils().load
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyling.buttonText,
                ),
              ),
      ),
    );
  }
}

class RoundButtonTwo extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final bool loading;
  const RoundButtonTwo(
      {super.key,
      required this.onpress,
      required this.title,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 335,
        decoration: const BoxDecoration(
            color: AppColor.buttonColorTwo,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyling.buttonTextTwo,
                ),
              ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  const MyWidget({super.key, required this.onpress, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 335,
        decoration: const BoxDecoration(
            color: AppColor.buttonColorTwo,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: Text(
            title,
            style: TextStyling.buttonTextTwo,
          ),
        ),
      ),
    );
  }
}
