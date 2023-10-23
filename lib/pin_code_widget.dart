import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PincodeWidget extends StatefulWidget {
  const PincodeWidget({super.key});

  @override
  State<PincodeWidget> createState() => _PincodeWidgetState();
}

class _PincodeWidgetState extends State<PincodeWidget> {
  String enteredPin = "";
  bool isPinVisible = false;

  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPin.length < 4) {
              enteredPin += number.toString();
            }
          });
        },
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.cover)),
                child: ListView(
                    padding: const EdgeInsets.only(top: 128),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Center(
                        child: Text(
                          "Enter PIN",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 58,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4,
                          (index) {
                            return Container(
                              margin: const EdgeInsets.all(6.0),
                              width: isPinVisible ? 50 : 16,
                              height: isPinVisible ? 50 : 16,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: index < enteredPin.length
                                      ? isPinVisible
                                          ? Colors.green
                                          : CupertinoColors.systemGreen
                                      : CupertinoColors.systemRed
                                          .withOpacity(0.7)),
                            );
                          },
                        ),
                      ),
                      // Expanded(
                      //   fl
                      //     child: GridView.builder(
                      //       padding: EdgeInsets.all(0.0),
                      //       physics: NeverScrollableScrollPhysics(),
                      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 3,
                      //   childAspectRatio: 0.8/0.6
                      // ), itemBuilder: itemBuilder))
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 3, left: 145),
                        child: Center(
                            child: Row(children: [
                          Text(
                            "Forgot?",
                            style:
                                TextStyle(color: Colors.black, fontSize: 13.5),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              " Tap here",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 13.5),
                            ),
                          )
                        ])),
                      ),
                      //
                      // for(var i=0;i<3;i++)
                      SizedBox(
                        height: isPinVisible ? 100.0 : 180.0,
                      ),
                      SizedBox(
                        height: isPinVisible ? 50.0 : 8.0,
                      ),
                      for (var i = 0; i < 3; i++)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          // decoration: BoxDecoration(
                          //     color: Colors.pinkAccent,borderRadius: BorderRadius.circular(60)
                          // ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              3,
                              (index) => numButton(1 + 3 * i + index),
                            ).toList(),
                          ),
                        ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: null, child: SizedBox()),
                            numButton(0),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (enteredPin.isNotEmpty) {
                                    enteredPin = enteredPin.substring(
                                        0, enteredPin.length - 1);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.backspace,
                                color: Colors.black,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      )
                    ]))));
  }
}
