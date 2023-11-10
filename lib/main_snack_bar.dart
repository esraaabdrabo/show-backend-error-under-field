import 'package:custom_snack_bar/show_snack_bar.dart';
import 'package:flutter/material.dart';

class SnackBarContent extends StatelessWidget {
  final Color? color;
  final String message;
  const SnackBarContent({required this.message, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;

    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(.1 * w)),
          padding: EdgeInsets.symmetric(horizontal: .1 * w, vertical: .01 * h),
          margin: EdgeInsets.only(top: .03 * h),
          child: Row(
            children: [
              //SizedBox(width: 17 * w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          color == Colors.green ? "Well Done" : "Oh , sorry",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => CustomSnackBar.hide(),
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: .6 * w,
                      child: Text(
                        message,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: .2 * w),
          alignment: Alignment.topLeft,
          child: Icon(Icons.message),
          width: .015 * w,
        )
      ],
    );
  }
}
