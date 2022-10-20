import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'single_job.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});
  

  final List<Map<String, dynamic>> jobList = const [
    {
      "address": "",
      "id": "jaipur_01",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Kampala_traffic.jpg/640px-Kampala_traffic.jpg",
      "lat": 26.922070,
      "lng": 75.778885,
      "name": "Kampala City ",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "New Delhi capital ",
      "id": "delhi_02",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Mbarara_Round_About_%28Amahembe_Gente%29.jpg/640px-Mbarara_Round_About_%28Amahembe_Gente%29.jpg",
      "lat": 28.644800,
      "lng": 77.216721,
      "name": "Mbarara Ciyt ",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "Mumbai City",
      "id": "mumbai_03",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Gulu_3.jpg/640px-Gulu_3.jpg",
      "lat": 19.076090,
      "lng": 72.877426,
      "name": "Gulu City ",
      "phone": "7014333352",
      "region": "South Asia"
    },
    {
      "address": "Udaipur City",
      "id": "udaipur_04",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Entebbe_Airport.JPG/640px-Entebbe_Airport.JPG",
      "lat": 24.571270,
      "lng": 73.691544,
      "name": "Entebbe Airport ",
      "phone": "7014333352",
      "region": "South Asia"
    }
  ];

  getDetails(Map singleJobData, BuildContext context) {
    print(singleJobData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingleJob(
          jobData: singleJobData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Jobs."),
      ),
      body: ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network(
                  jobList[index]['image'],
                  height: 200,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        jobList[index]['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getDetails(jobList[index], context);
                      },
                      child: const Text("View Details"),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
