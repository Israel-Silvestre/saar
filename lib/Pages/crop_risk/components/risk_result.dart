import 'package:flutter/material.dart';

import '../utils/constants.dart';

class RiskResult extends StatefulWidget {
  final List<List<bool>> soilRiskResult;

  const RiskResult({
    super.key, required this.soilRiskResult,
  });

  @override
  State<RiskResult> createState() => _RiskResultState();
}

class _RiskResultState extends State<RiskResult> {
  int selectedMonth = 0;

  @override
  void initState() {
    super.initState();
  }

  BoxDecoration boxStyle() => const BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [BoxShadow(
      color: Colors.black,
      offset: Offset(0, 4),
      blurRadius: 8,
    )],
  );

  void nextMonth() {
    setState(() {
      selectedMonth = selectedMonth < 11 ? selectedMonth+1 : selectedMonth;
    });
  }

  void previousMonth() {
    setState(() {
      selectedMonth = selectedMonth > 0 ? selectedMonth-1 : selectedMonth;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
    height: 30,
    width: 1000,
    margin: const EdgeInsets.all(10),
    decoration: boxStyle(),
    child: Column(children: [
      Expanded(flex: 1, child: MonthTitle(monthName: months[selectedMonth] ?? "")),
      Expanded(flex: 3, child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(onTap: previousMonth, child: const Icon(Icons.arrow_back_ios_new_rounded)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RiskDate(date: "01 - 10", available: widget.soilRiskResult[selectedMonth][0]),
              RiskDate(date: "11 - 20", available: widget.soilRiskResult[selectedMonth][1]),
              RiskDate(date: "21 - 30", available: widget.soilRiskResult[selectedMonth][2]),
            ],
          ),
          GestureDetector(onTap: nextMonth, child: const Icon(Icons.arrow_forward_ios_rounded)),
        ]
      ))
    ]),
  );
}

class MonthTitle extends StatelessWidget {
  final String monthName;

  const MonthTitle({
    super.key,
    required this.monthName,
  });

  BoxDecoration tittleStyle() => const BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
  );

  @override
  Widget build(BuildContext context) => Container(
    width: 1000,
    alignment: Alignment.center,
    decoration:  tittleStyle(),
    child: Text(monthName, style: const TextStyle(color: Colors.white, fontSize: 20))
  );
}

class RiskDate extends StatelessWidget {
  final String date;
  final bool available;

  const RiskDate({
    super.key,
    required this.available,
    required this.date,
  });

  BoxDecoration riskAvailableStyle() => BoxDecoration(
    color: available ? const Color.fromARGB(255, 119, 230, 122) : const Color.fromARGB(255, 231, 93, 83),
    borderRadius: const BorderRadius.all(Radius.circular(15))
  );

  @override
  Widget build(BuildContext context) => Container(
    width: 100,
    height: 30,
    margin: const EdgeInsets.only(top: 3, bottom: 3),
    alignment: Alignment.center,
    decoration: riskAvailableStyle(),
    child: Text(date),
  );
}