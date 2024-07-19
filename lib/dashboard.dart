import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class dashboard extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('FitnessFlow'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
          stream: _firestore
              .collection('step_counter')
              .doc('step_counterID')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text('No data available'));
            }

            var data = snapshot.data!.data() as Map<String, dynamic>;
            int totalSteps = data['totalSteps'];
            int goalSteps = data['goalSteps'];
            int minutes = data['minutes'];
            int kcal = data['kcal'];

            return Column(
              children: [
                _buildStepsContainer(totalSteps, goalSteps, minutes, kcal),
                _buildWorkoutsContainer(context),
                _buildFoodContainer(context),
                _buildBodyCompositionContainer(),
                _buildWaterConsumptionContainer(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStepsContainer(
      int totalSteps, int goalSteps, int minutes, int kcal) {
    double percentage = goalSteps != 0 ? (totalSteps / goalSteps) * 100 : 0;

    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 68, 68, 68),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.directions_walk, color: Colors.red),
                  SizedBox(width: 8),
                  Text(
                    '$totalSteps',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    ' Steps',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.timer, color: Colors.red),
                  SizedBox(width: 8),
                  Text(
                    '$minutes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    ' Minutes',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.local_fire_department, color: Colors.red),
                  SizedBox(width: 8),
                  Text(
                    '$kcal',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    ' Kcal',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${percentage.toStringAsFixed(1)} %',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 202, 97, 90)),
              ),
              SizedBox(height: 10),
              Container(
                width: 100,
                child: LinearProgressIndicator(
                  value: percentage / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  minHeight: 7,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutsContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 68, 68, 68),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Workouts',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildWorkoutIcon(
                  context, Icons.directions_walk, 'Walking', Colors.blue),
              _buildWorkoutIcon(
                  context, Icons.directions_run, 'Running', Colors.green),
              _buildWorkoutIcon(context, Icons.hiking, 'Hiking', Colors.orange),
              _buildWorkoutIcon(
                  context, Icons.fitness_center, 'Workout', Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutIcon(
      BuildContext context, IconData icon, String label, Color color) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => LocationScreen(workoutType: label)),
      //   );
      // },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          SizedBox(height: 10),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildFoodContainer(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 130,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 68, 68, 68),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.restaurant, color: Colors.red),
              SizedBox(width: 10),
              Text(
                'Food',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // _showMealTypeBottomSheet(context);
            },
            child: Text("Enter Meal"),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyCompositionContainer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 68, 68, 68),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Body Composition',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterConsumptionContainer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 68, 68, 68),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Water Consumption',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
