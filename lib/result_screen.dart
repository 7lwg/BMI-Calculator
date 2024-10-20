import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:percent_indicator/percent_indicator.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  double result;
  // ignore: prefer_typing_uninitialized_variables
  var state;
  // ignore: use_key_in_widget_constructors
  ResultScreen({required this.result, required this.state});

  @override
  Widget build(BuildContext context) {
    final landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              result = displayed_weight / (displayed_height * displayed_height);
              displayed_age = -1;
              displayed_weight = -1;
              displayed_height = -1;
              selected = [true, false];
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BMI_Calculator()));
            },
          ),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
          onWillPop: () async {
            result = displayed_weight / (displayed_height * displayed_height);
            displayed_age = -1;
            displayed_weight = -1;
            displayed_height = -1;
            selected = [true, false];
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BMI_Calculator()));
            return true;
          },
          child: SingleChildScrollView(
            // ignore: sized_box_for_whitespace
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: (landscape)
                  ? MediaQuery.sizeOf(context).height * 1.8
                  : MediaQuery.sizeOf(context).height -
                      appBarHeight -
                      statusBarHeight,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 20,
                  ),
                  Text(
                    // ignore: unnecessary_brace_in_string_interps
                    "${state}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 10,
                  ),
                  Container(
                    padding: (landscape)
                        ? EdgeInsets.all(
                            MediaQuery.of(context).size.height * 1 / 15)
                        : EdgeInsets.all(
                            MediaQuery.of(context).size.width * 1 / 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),                          
                            blurRadius: 10,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150)),
                    child: CircularPercentIndicator(
                        animation: true,
                        animationDuration: 1800,
                        radius: (landscape)
                            ? MediaQuery.of(context).size.width * 2 / 15
                            : MediaQuery.of(context).size.height * 2 / 15,
                        lineWidth: 7.0,
                        percent: (displayed_age + 2 <= 19)
                            ? ((result / 24.6) > 1.0)
                                ? (result / result)
                                : (result / 24.6)
                            : ((result / 40) > 1.0)
                                ? (result / result)
                                : (result / 40),
                        center: Container(
                          width: (landscape)
                              ? MediaQuery.of(context).size.height *
                                  (140 / MediaQuery.of(context).size.height)
                              : MediaQuery.of(context).size.width *
                                  (140 / MediaQuery.of(context).size.width),
                          height: (landscape)
                              ? MediaQuery.of(context).size.width *
                                  (140 / MediaQuery.of(context).size.width)
                              : MediaQuery.of(context).size.height *
                                  (140 / MediaQuery.of(context).size.height),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 10,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Center(
                              child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: result.toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontSize: 35,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w900),
                                ),
                                (displayed_age + 2 <= 19)
                                    ? TextSpan(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        text: '\n' +
                                            (result / 24.6 * 100)
                                                .toStringAsFixed(2) +
                                            '%',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700),
                                      )
                                    : TextSpan(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        text: '\n' +
                                            (result / 40 * 100)
                                                .toStringAsFixed(2) +
                                            '%',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700),
                                      ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        progressColor: Colors.red,
                        circularStrokeCap: CircularStrokeCap.round),
                  ),
                  const Spacer(),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          (100 / MediaQuery.of(context).size.width),
                      height: MediaQuery.of(context).size.height *
                          (120 / MediaQuery.of(context).size.height),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *
                                (60 / MediaQuery.of(context).size.width),
                            height: MediaQuery.of(context).size.height *
                                (60 / MediaQuery.of(context).size.height),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  result = displayed_weight /
                                      (displayed_height * displayed_height);
                                  displayed_age = -1;
                                  displayed_weight = -1;
                                  displayed_height = -1;
                                  selected = [true, false];
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BMI_Calculator()));
                                },
                                icon: const Icon(
                                  Icons.loop,
                                  size: 30,
                                )),
                          ),
                          const Text(
                            "Recalculate",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
