import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Helper class for showing error snackbar
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

// Function to show error snackbar with a provided error message
void showErrorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomSnackBarContent(errorText: errorMessage),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

// Widget for custom snackbar content with error message
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
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            height: 90, // Increased height
            decoration: BoxDecoration(
              color: Color(0xFFC72C41),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Error!",
                        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600), // Increased font size
                      ),
                      Flexible(
                        child: Text(
                          errorText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, // Increased font size
                          ),
                          maxLines: 3, // Allowing more lines
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50, // Adjusted position
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: SvgPicture.asset(
              "assets/images/bubbles.svg",
              height: 40, // Increased height
              width: 40, // Increased width
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

// Widget for custom snackbar content with success message
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
                      style: TextStyle(fontSize: 17, color: Colors.white),
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
