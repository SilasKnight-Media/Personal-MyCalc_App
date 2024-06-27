import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.equationText,
    required this.textEditingController,
  });

  final String name;
  final String equationText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    textEditingController.text = equationText;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '2+2',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
