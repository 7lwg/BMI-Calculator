import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({super.key});

  @override
  State<BMI_Calculator> createState() => _BMI_CalculatorState();
}

// List<bool> _selected = List.generate(2, (index) => false);

List<bool> selected = [true, false];

// ignore: non_constant_identifier_names
List<List<double>> boys_rages = [
  [14.8, 18.4, 19.6], //0  age 2
  [14.5, 18.0, 19.5], //1  age 3
  [14.2, 17.6, 19.1], //2  age 4
  [14.0, 17.3, 18.7], //3  age 5
  [13.9, 17.1, 18.5], //4  age 6
  [14.0, 17.5, 19.0], //5  age 7
  [14.1, 17.9, 19.4], //6  age 8
  [14.3, 18.3, 19.8], //7  age 9
  [14.5, 18.7, 20.2], //8  age 10
  [14.7, 19.0, 20.6], //9  age 11
  [14.9, 19.4, 21.1], //10  age 12
  [15.2, 19.8, 21.6], //11  age 13
  [15.6, 20.2, 22.1], //12  age 14
  [16.0, 20.6, 22.5], //13  age 15
  [16.3, 21.0, 23.0], //14  age 16
  [16.5, 21.5, 23.5], //15  age 17
  [16.7, 21.9, 24.0], //16  age 18
  [17.0, 22.3, 24.6] //17  age 19
];

// ignore: non_constant_identifier_names
List<List<double>> girls_rages = [
  [14.8, 18.5, 19.7],
  [14.5, 18.2, 19.3],
  [14.3, 18.0, 19.1],
  [14.1, 17.5, 18.5],
  [14.0, 17.1, 18.3],
  [14.1, 17.5, 19.0],
  [14.2, 17.8, 19.5],
  [14.4, 18.1, 19.8],
  [14.6, 18.5, 20.3],
  [14.8, 18.9, 20.7],
  [15.0, 19.3, 21.1],
  [15.2, 19.7, 21.6],
  [15.5, 20.1, 22.0],
  [15.8, 20.5, 22.5],
  [16.0, 21.0, 23.1],
  [16.2, 21.4, 23.5],
  [16.4, 21.8, 24.0],
  [16.7, 22.3, 24.6]
];

void _showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 95, 94, 94),
      textColor: Colors.white,
      fontSize: 16.0);
}

// ignore: unused_element
int _currentValue = 0;

var color = Colors.black;

// ignore: non_constant_identifier_names
var displayed_height = -1;
// ignore: non_constant_identifier_names
var displayed_weight = -1;
// ignore: non_constant_identifier_names
var displayed_age = -1;

// ignore: non_constant_identifier_names
double offset_age = 0;
// ignore: non_constant_identifier_names
double offset_weight = 0;
// ignore: non_constant_identifier_names
double offset_height = 0;

// ignore: prefer_typing_uninitialized_variables
var result;
// ignore: prefer_typing_uninitialized_variables
var state;

// ignore: non_constant_identifier_names
final ScrollController _scrollController_weight = ScrollController();
// ignore: non_constant_identifier_names
final ScrollController _scrollController_age = ScrollController();
// ignore: non_constant_identifier_names
final ScrollController _scrollController_height = ScrollController();

// ignore: camel_case_types
class _BMI_CalculatorState extends State<BMI_Calculator> {
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
      ),
      body: SingleChildScrollView(
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
                height: MediaQuery.of(context).size.height *
                    (10 / MediaQuery.of(context).size.height),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ToggleButtons(
                    // ignore: sort_child_properties_last
                    children: [
                      SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 40) * 1 / 2,
                          child: const Text(
                            "Male",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(
                          width:
                              (MediaQuery.of(context).size.width - 40) * 1 / 2,
                          child: const Text(
                            "Female",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                    isSelected: selected,
                    onPressed: ((index) {
                      setState(() {
                        selected[0] = false;
                        selected[1] = false;
                        selected[index] = !selected[index];
                      });
                    }),
                    color: Colors.black,
                    selectedColor: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    (15 / MediaQuery.of(context).size.height),
              ),

              // height
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                    ),
                  ],
                ),
                width: (MediaQuery.of(context).size.width - 40),
                height: MediaQuery.of(context).size.height *
                    (190 / MediaQuery.of(context).size.height),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width *
                        (15 / MediaQuery.of(context).size.width),
                    right: MediaQuery.of(context).size.width *
                        (15 / MediaQuery.of(context).size.width),
                    top: MediaQuery.of(context).size.height *
                        (15 / MediaQuery.of(context).size.height)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Height',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: ' (in cm)',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: MediaQuery.of(context).size.height *
                          (60 / MediaQuery.of(context).size.height),
                      child: ListView.builder(
                        controller: _scrollController_height,
                        scrollDirection: Axis.horizontal,
                        itemCount: 231,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              color = Colors.red;
                              displayed_height = index;
                              setState(() {});
                            },
                            // ignore: sized_box_for_whitespace
                            child: Container(
                                width: (MediaQuery.of(context).size.width -
                                        40 -
                                        MediaQuery.of(context).size.width *
                                            (15 /
                                                MediaQuery.of(context)
                                                    .size
                                                    .width) *
                                            2) /
                                    5,
                                child: Center(
                                  child: Text(
                                    (index + 20).toString(),
                                    style: TextStyle(
                                        fontWeight: index == displayed_height
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        fontSize:
                                            index == displayed_height ? 30 : 25,
                                        color: index == displayed_height
                                            ? Colors.red
                                            : Colors.grey),
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: MediaQuery.of(context).size.width * 1 / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width *
                                  (30 / MediaQuery.of(context).size.width),
                              height: MediaQuery.of(context).size.height *
                                  (30 / MediaQuery.of(context).size.height),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: IconButton(
                                  onPressed: () {
                                    if (displayed_height < 230) {
                                      _scrollController_height.animateTo(
                                        (offset_height +
                                            (((displayed_height - 1) *
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    40 -
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        (15 /
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width) *
                                                        2) /
                                                5))),
                                        duration:
                                            const Duration(milliseconds: 1),
                                        curve: Curves.easeInOut,
                                      );
                                      displayed_height++;
                                      setState(() {});
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 15,
                                  ))),
                          Container(
                              width: MediaQuery.of(context).size.width *
                                  (30 / MediaQuery.of(context).size.width),
                              height: MediaQuery.of(context).size.height *
                                  (30 / MediaQuery.of(context).size.height),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: IconButton(
                                  onPressed: () {
                                    if (displayed_height > 0) {
                                      _scrollController_height.animateTo(
                                        offset_height +
                                            (((displayed_height - 3) *
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    40 -
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        (15 /
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width) *
                                                        2) /
                                                5)),
                                        duration:
                                            const Duration(milliseconds: 1),
                                        curve: Curves.easeInOut,
                                      );
                                      displayed_height--;

                                      setState(() {});
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 15,
                                  )))
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        "assets/images/scale 1.jpg",
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height *
                            (30 / MediaQuery.of(context).size.height),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    (15 / MediaQuery.of(context).size.height),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      (20 / MediaQuery.of(context).size.width),
                  right: MediaQuery.of(context).size.width *
                      (20 / MediaQuery.of(context).size.width),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // weight
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      width: (landscape)
                          ? MediaQuery.sizeOf(context).width * 0.45
                          : MediaQuery.of(context).size.width *
                              (170 / MediaQuery.of(context).size.width),
                      height: MediaQuery.of(context).size.height *
                          (170 / MediaQuery.of(context).size.height),
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width *
                              (20 / MediaQuery.of(context).size.width)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'Weight',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                  text: ' (in kg)',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: (landscape)
                                ? ((MediaQuery.sizeOf(context).width * 0.45) -
                                    ((MediaQuery.of(context).size.width *
                                            (20 /
                                                MediaQuery.of(context)
                                                    .size
                                                    .width)) *
                                        2))
                                : ((MediaQuery.of(context).size.width *
                                        (170 /
                                            MediaQuery.of(context)
                                                .size
                                                .width)) -
                                    ((MediaQuery.of(context).size.width *
                                            (20 /
                                                MediaQuery.of(context)
                                                    .size
                                                    .width)) *
                                        2)),
                            height: MediaQuery.of(context).size.height *
                                (40 / MediaQuery.of(context).size.height),
                            child: ListView.builder(
                              controller: _scrollController_weight,
                              scrollDirection: Axis.horizontal,
                              itemCount: 310,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    color = Colors.red;
                                    displayed_weight = index;
                                    setState(() {});
                                  },
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    width: (landscape)
                                        ? (((MediaQuery.sizeOf(context).width *
                                                    0.45) -
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    (20 /
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width) *
                                                    2)) /
                                            3)
                                        : (((MediaQuery.of(context).size.width *
                                                    (170 /
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width)) -
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    (20 /
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width) *
                                                    2)) /
                                            3),
                                    height: MediaQuery.of(context).size.height *
                                        (10 /
                                            MediaQuery.of(context).size.height),
                                    child: Center(
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            fontWeight:
                                                index == displayed_weight
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                            fontSize: index == displayed_weight
                                                ? 23
                                                : 18,
                                            color: index == displayed_weight
                                                ? Colors.red
                                                : Colors.grey),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: MediaQuery.of(context).size.width * 1 / 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        (30 /
                                            MediaQuery.of(context).size.width),
                                    height: MediaQuery.of(context).size.height *
                                        (30 /
                                            MediaQuery.of(context).size.height),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 10,
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                        onPressed: () {
                                          if (displayed_weight < 309 &&
                                              landscape == true) {
                                            _scrollController_weight.animateTo(
                                              offset_weight +
                                                  (displayed_weight *
                                                      (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.45 -
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              (20 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                              2)) /
                                                      3),
                                              duration: const Duration(
                                                  milliseconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                            displayed_weight++;

                                            setState(() {});
                                          }

                                          if (displayed_weight < 309 &&
                                              landscape == false) {
                                            _scrollController_weight.animateTo(
                                              offset_weight +
                                                  (displayed_weight *
                                                      (MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              (170 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) -
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              (20 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                              2)) /
                                                      3),
                                              duration: const Duration(
                                                  milliseconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                            displayed_weight++;

                                            setState(() {});
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          size: 15,
                                        ))),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        (30 /
                                            MediaQuery.of(context).size.width),
                                    height: MediaQuery.of(context).size.height *
                                        (30 /
                                            MediaQuery.of(context).size.height),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 10,
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                        onPressed: () {
                                          if (displayed_weight > 0 &&
                                              landscape == true) {
                                            _scrollController_weight.animateTo(
                                              offset_weight +
                                                  ((displayed_weight - 2) *
                                                      (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.45 -
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              (20 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                              2)) /
                                                      3),
                                              duration: const Duration(
                                                  milliseconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                            displayed_weight--;

                                            setState(() {});
                                          }

                                          if (displayed_weight > 0 &&
                                              landscape == false) {
                                            _scrollController_weight.animateTo(
                                              offset_weight +
                                                  ((displayed_weight - 2) *
                                                      (MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              (170 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) -
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              (20 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                              2)) /
                                                      3),
                                              duration: const Duration(
                                                  milliseconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                            displayed_weight--;

                                            setState(() {});
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 15,
                                        )))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // Age
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      width: (landscape)
                          ? (MediaQuery.sizeOf(context).width * 0.45)
                          : (MediaQuery.of(context).size.width *
                              (170 / MediaQuery.of(context).size.width)),
                      height: MediaQuery.of(context).size.height *
                          (170 / MediaQuery.of(context).size.height),
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width *
                              (20 / MediaQuery.of(context).size.width)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: (landscape)
                                ? ((MediaQuery.sizeOf(context).width * 0.45) -
                                    ((MediaQuery.of(context).size.width *
                                            (20 /
                                                MediaQuery.of(context)
                                                    .size
                                                    .width)) *
                                        2))
                                : ((MediaQuery.of(context).size.width *
                                        (170 /
                                            MediaQuery.of(context)
                                                .size
                                                .width)) -
                                    ((MediaQuery.of(context).size.width *
                                            (20 /
                                                MediaQuery.of(context)
                                                    .size
                                                    .width)) *
                                        2)),
                            height: MediaQuery.of(context).size.height *
                                (50 / MediaQuery.of(context).size.height),
                            child: ListView.builder(
                              controller: _scrollController_age,
                              scrollDirection: Axis.horizontal,
                              itemCount: 109,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    color = Colors.red;
                                    displayed_age = index;
                                    setState(() {});
                                  },
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    width: (landscape)
                                        ? (((MediaQuery.sizeOf(context).width *
                                                    0.45) -
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    (20 /
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width) *
                                                    2)) /
                                            3)
                                        : (((MediaQuery.of(context).size.width *
                                                    (170 /
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width)) -
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    (20 /
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width) *
                                                    2)) /
                                            3),
                                    height: MediaQuery.of(context).size.height *
                                        (10 /
                                            MediaQuery.of(context).size.height),
                                    child: Center(
                                      child: Text(
                                        (index + 2).toString(),
                                        style: TextStyle(
                                            fontWeight: index == displayed_age
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            fontSize: index == displayed_age
                                                ? 23
                                                : 18,
                                            color: index == displayed_age
                                                ? Colors.red
                                                : Colors.grey),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: MediaQuery.of(context).size.width * 1 / 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        (30 /
                                            MediaQuery.of(context).size.width),
                                    height: MediaQuery.of(context).size.height *
                                        (30 /
                                            MediaQuery.of(context).size.height),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 10,
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                        onPressed: () {
                                          if (displayed_age < 108 &&
                                              landscape == true) {
                                            _scrollController_age.animateTo(
                                              offset_age +
                                                  (displayed_age *
                                                      ((MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.45) -
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              (20 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                              2)) /
                                                      3),
                                              duration: const Duration(
                                                  milliseconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                            displayed_age++;
                                            setState(() {});
                                          } else {
                                            if (displayed_age < 108 &&
                                                landscape == false) {
                                              _scrollController_age.animateTo(
                                                offset_age +
                                                    (displayed_age *
                                                        ((MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                (170 /
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width)) -
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (20 /
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width) *
                                                                2)) /
                                                        3),
                                                duration: const Duration(
                                                    milliseconds: 1),
                                                curve: Curves.easeInOut,
                                              );
                                              displayed_age++;

                                              setState(() {});
                                            }
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          size: 15,
                                        ))),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        (30 /
                                            MediaQuery.of(context).size.width),
                                    height: MediaQuery.of(context).size.height *
                                        (30 /
                                            MediaQuery.of(context).size.height),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 10,
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                        onPressed: () {
                                          if (displayed_age > 0 &&
                                              landscape == true) {
                                            _scrollController_age.animateTo(
                                              offset_age +
                                                  ((displayed_age - 2) *
                                                      ((MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.45) -
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              (20 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                              2)) /
                                                      3),
                                              duration: const Duration(
                                                  milliseconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                            displayed_age--;

                                            setState(() {});
                                          }

                                          if (displayed_age > 0 &&
                                              landscape == false) {
                                            _scrollController_age.animateTo(
                                              offset_age +
                                                  ((displayed_age - 2) *
                                                      ((MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              (170 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width)) -
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              (20 /
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width) *
                                                              2)) /
                                                      3),
                                              duration: const Duration(
                                                  milliseconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                            displayed_age--;

                                            setState(() {});
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 15,
                                        )))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
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
                            result = (displayed_weight + 1) /
                                (((displayed_height + 20) / 100) *
                                    ((displayed_height + 20) / 100));
                            if (displayed_age != -1 &&
                                displayed_height != -1 &&
                                displayed_weight != -1) {
                              if (displayed_age + 2 <= 19) {
                                if (selected[0] == true &&
                                    selected[1] == false) // boy
                                {
                                  if (result <
                                      boys_rages[displayed_age + 2 - 2][0]) {
                                    state = "underweight";
                                  } else if (result <
                                      boys_rages[displayed_age + 2 - 2][1]) {
                                    state = "Normal Weight";
                                  } else if (result <
                                      boys_rages[displayed_age + 2 - 2][2]) {
                                    state = "Overweight";
                                  } else if (result >=
                                      boys_rages[displayed_age + 2 - 2][2]) {
                                    state = "Obese";
                                  }
                                } else if (selected[1] == true &&
                                    selected[0] == false) // girl
                                {
                                  if (result <
                                      girls_rages[displayed_age + 2 - 2][0]) {
                                    state = "underweight";
                                  } else if (result <
                                      girls_rages[displayed_age + 2 - 2][1]) {
                                    state = "Normal Weight";
                                  } else if (result <
                                      girls_rages[displayed_age + 2 - 2][2]) {
                                    state = "Overweight";
                                  } else if (result >=
                                      girls_rages[displayed_age + 2 - 2][2]) {
                                    state = "Obese";
                                  }
                                }
                              } else {
                                if (result < 16.5) {
                                  state = "Severely underweight";
                                } else if (result < 18.5) {
                                  state = "Underweight";
                                } else if (result < 24.9) {
                                  state = "Normal weight ";
                                } else if (result < 29.9) {
                                  state = "Overweight";
                                } else if (result < 34.9) {
                                  state = "Obesity class I";
                                } else if (result < 39.9) {
                                  state = "Obesity class II";
                                } else if (result > 39.9) {
                                  state = "Obesity class III";
                                }
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultScreen(
                                            result: result,
                                            state: state,
                                          )));
                            } else {
                              if (displayed_age != -1 &&
                                  displayed_height != -1 &&
                                  displayed_weight == -1) {
                                _showToast('Enter Your Weight');
                              } else if (displayed_age != -1 &&
                                  displayed_height == -1 &&
                                  displayed_weight == -1) {
                                _showToast('Enter Your Height and Weight');
                              } else if (displayed_age == -1 &&
                                  displayed_height != -1 &&
                                  displayed_weight == -1) {
                                _showToast('Enter Your Weight and Age');
                              } else if (displayed_age == -1 &&
                                  displayed_height == -1 &&
                                  displayed_weight == -1) {
                                _showToast(
                                    'Enter Your Height , Weight and Age');
                              } else if (displayed_age != -1 &&
                                  displayed_height == -1 &&
                                  displayed_weight != -1) {
                                _showToast('Enter Your Height');
                              } else if (displayed_age == -1 &&
                                  displayed_height == -1 &&
                                  displayed_weight != -1) {
                                _showToast('Enter Your Height and Age');
                              } else if (displayed_age == -1 &&
                                  displayed_height != -1 &&
                                  displayed_weight != -1) {
                                _showToast('Enter Your Age');
                              }
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            size: 25,
                          )),
                    ),
                    const Text(
                      "Calculate",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
