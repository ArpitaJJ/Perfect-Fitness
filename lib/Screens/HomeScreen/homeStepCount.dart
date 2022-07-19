import 'package:fitness_monitoring/Models/Providers/healthProvider.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class HomeStepCount extends StatefulWidget {
  const HomeStepCount({Key? key}) : super(key: key);

  @override
  State<HomeStepCount> createState() => _HomeStepCountState();
}

class _HomeStepCountState extends State<HomeStepCount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: max(MediaQuery.of(context).size.height * 0.35, 300),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: secondaryColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            "Steps",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              SizedBox(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Colors.grey.withOpacity(0.1),
                        value: 40,
                        showTitle: false,
                        radius: 5,
                      ),
                      PieChartSectionData(
                        color: greenTextColor,
                        value: 50,
                        showTitle: false,
                        radius: 10,
                      ),
                      PieChartSectionData(
                        color: Colors.grey.withOpacity(0.1),
                        value: 25,
                        showTitle: false,
                        radius: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<HealthProvider>(
                builder: (ctx, value, child) {
                  return Positioned(
                      top: 100,
                      left: 145,
                      right: 145,
                      child: Column(
                        children: [
                          const Icon(Icons.directions_run_sharp, size: 32),
                          Text(
                            value.getSteps.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
