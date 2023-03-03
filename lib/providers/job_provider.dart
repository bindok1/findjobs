import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobsapp/models/job_model.dart';

class JobProvider with ChangeNotifier {
  Future<List<JobModel>> getJobs() async {
    try {
      var response = await http.get(
        Uri.parse('https://future-jobs-api.vercel.app/jobs'),
      );

      // ignore: avoid_print
      print(response.statusCode);
      // ignore: avoid_print
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);
        // ignore: avoid_function_literals_in_foreach_calls
        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return [];
    }
  }
}
