import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String content;

  const InfoWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.black54,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      content,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
