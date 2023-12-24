import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorSnackbar {
  static void showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomSnackBarContent(errorText: '',),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    super.key,
    required this.errorText,
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Error!",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      errorText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 42,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: SvgPicture.asset(
              "assets/images/bubbles.svg",
              height: 48,
              width: 40,
              color: Colors.red,
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/fail.svg",
                height: 40,
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  "assets/images/close.svg",
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class SuccessSnackbar {
  static void showsuccessSnackbar(BuildContext context, String successMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SuccessSnackBarContent(successText: '',),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

class SuccessSnackBarContent extends StatelessWidget {
  const SuccessSnackBarContent({
    super.key,
    required this.successText,
  });

  final String successText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFF43A047),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Success",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      successText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 42,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: SvgPicture.asset(
              "assets/images/bubbles.svg",
              height: 48,
              width: 40,
              color: Color(0xFF2E7D32),
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/fail.svg",
                height: 40,
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  "assets/images/close.svg",
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
