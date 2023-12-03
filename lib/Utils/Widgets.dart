import 'package:cached_network_image/cached_network_image.dart';
import 'package:dictionaryapp/Utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Background extends StatelessWidget {
  Color bgcolor;
  Widget child;
  Background({super.key, required this.bgcolor, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.black, width: 2.0)),
          child: child,
        ),
      ),
    );
  }
}

class TextWithStroke extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double strokeWidth;
  final Color strokeColor;

  const TextWithStroke({
    super.key,
    required this.text,
    required this.textStyle,
    required this.strokeWidth,
    required this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(text,
            style: textStyle.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..color = strokeColor,
            )),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final Color bordercolor;
  final Color buttoncolor;
  final String buttontext;
  final VoidCallback ontap;
  final TextStyle textStyle;
  const MyButton(
      {super.key,
      required this.buttoncolor,
      required this.bordercolor,
      required this.buttontext,
      required this.ontap,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
          child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: buttoncolor,
            border: Border.all(color: bordercolor, width: 3)),
        child: Center(
          child: Text(
            buttontext,
            style: textStyle,
          ),
        ),
      )),
    );
  }
}

class Mytextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController controler;
  final Icon? suffixicon;
  final Color? bordercolor;
  final String? Function(String?)? validator;
  final FocusNode? f;
  const Mytextfield(
      {super.key,
      required this.hinttext,
      required this.controler,
      this.suffixicon,
      this.validator,
      this.f,
      this.bordercolor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: f,
      controller: controler,
      style: const TextStyle(
          fontStyle: FontStyle.normal, fontFamily: 'montserrat'),
      validator: validator ??
          (value) {
            return null;
          },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: bordercolor!)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: bordercolor!)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: bordercolor!)),
          hintText: hinttext,
          labelStyle: const TextStyle(
            fontFamily: "montserrat",
          ),
          suffixIcon: suffixicon,
          hintStyle: const TextStyle(
              fontFamily: "montserrat",
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w600)),
    );
  }
}

class MypasswordTextfield extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function()? onTap;
  const MypasswordTextfield(
      {super.key,
      required this.controller,
      this.obscureText = true,
      this.onTap,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      style: const TextStyle(
          fontStyle: FontStyle.normal, fontFamily: 'montserrat'),
      validator: validator ??
          (value) {
            return null;
          },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          filled: true,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(obscureText! ? Icons.visibility : Icons.visibility_off),
          ),
          fillColor: Colors.white,
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black)),
          hintText: "Password",
          hintStyle: const TextStyle(
              fontFamily: "montserrat",
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w600)),
    );
  }
}

////
class categorywidget extends StatelessWidget {
  final String categoryname;
  final String categoryimg;
  final VoidCallback ontap;
  const categorywidget({
    required this.categoryname,
    required this.categoryimg,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Image.asset(
            categoryimg,
          ),
          TextWithStroke(
            text: categoryname,
            textStyle: TextStyle(
                fontFamily: "coiny",
                fontSize: 30,
                color: Colors.orange.shade400,
                fontWeight: FontWeight.bold),
            strokeWidth: 3,
            strokeColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

///

/* class ImageAndTextWidget extends StatefulWidget {
  final Map<String, dynamic> data;

  const ImageAndTextWidget({super.key, required this.data});

  @override
  State<ImageAndTextWidget> createState() => _ImageAndTextWidgetState();
}

class _ImageAndTextWidgetState extends State<ImageAndTextWidget> {
  VideoPlayerController? controller;
  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(Uri.parse(
      widget.data['sign_link'],
    ))
      ..initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller!.play();
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 120,
              height: 120,
              child: VideoPlayer(controller!),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.data['sign_name'],
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
 */
class TextAndImageWidget extends StatelessWidget {
  final String text;
  final String imagePath;

  const TextAndImageWidget({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2.5,
      child: Column(
        children: [
          Container(
            width: 220,
            height: 220,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                width: 200, // Adjust the image size as needed
                height: 200.0,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          ),
          TextWithStroke(
            strokeColor: Colors.black,
            strokeWidth: 2,
            textStyle: const TextStyle(
                fontFamily: "coiny",
                fontSize: 40,
                color: AppColors.white,
                fontWeight: FontWeight.w600),
            text: text,
          ),
        ],
      ),
    );
  }
}
