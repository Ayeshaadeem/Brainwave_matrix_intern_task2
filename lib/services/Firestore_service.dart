import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add user data
  Future<void> addUserData(User user, String name) async {
    return await _db.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'name': name,
      'email': user.email,
    });
  }

  // Steps
  Future<DocumentReference<Map<String, dynamic>>> addStepsData(
      String userId, Map<String, dynamic> stepsData) async {
    return await _db
        .collection('users')
        .doc(userId)
        .collection('steps')
        .add(stepsData);
  }

  Stream<List<Map<String, dynamic>>> getStepsData(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .collection('steps')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  // Workouts
  Future<DocumentReference<Map<String, dynamic>>> addWorkoutData(
      String userId, Map<String, dynamic> workoutData) async {
    return await _db
        .collection('users')
        .doc(userId)
        .collection('workouts')
        .add(workoutData);
  }

  Stream<List<Map<String, dynamic>>> getWorkoutData(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .collection('workouts')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  // Meals
  Future<DocumentReference<Map<String, dynamic>>> addMealData(
      String userId, Map<String, dynamic> mealData) async {
    return await _db
        .collection('users')
        .doc(userId)
        .collection('meals')
        .add(mealData);
  }

  Stream<List<Map<String, dynamic>>> getMealData(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .collection('meals')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  // Body Composition
  Future<void> updateBodyComposition(
      String userId, Map<String, dynamic> bodyData) async {
    return await _db
        .collection('users')
        .doc(userId)
        .update({'bodyComposition': bodyData});
  }

  Future<Map<String, dynamic>?> getBodyComposition(String userId) async {
    DocumentSnapshot snapshot = await _db.collection('users').doc(userId).get();
    return snapshot.data() as Map<String, dynamic>? ?? {};
  }

  // Water Intake
  Future<void> addWaterIntake(String userId, int waterAmount) async {
    return await _db
        .collection('users')
        .doc(userId)
        .update({'waterIntake': waterAmount});
  }

  Future<int?> getWaterIntake(String userId) async {
    DocumentSnapshot snapshot = await _db.collection('users').doc(userId).get();
    return (snapshot.data() as Map<String, dynamic>?)?['waterIntake'] as int?;
  }

  // Activity History
  Future<DocumentReference<Map<String, dynamic>>> addActivityHistory(
      String userId, Map<String, dynamic> activityData) async {
    return await _db
        .collection('users')
        .doc(userId)
        .collection('history')
        .add(activityData);
  }

  Stream<List<Map<String, dynamic>>> getActivityHistory(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .collection('history')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }
}
