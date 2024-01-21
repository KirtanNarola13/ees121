import 'package:flutter/material.dart';
import '../../../../Global/globalUser.dart';
import '../Global/work_global.dart';

class WorkProvider extends ChangeNotifier {
  WorkGlobal? work = WorkGlobal(isSent: false);

  void changeRequest() async {
    work?.isSent = !work!.isSent; // Toggle the value
    notifyListeners();
  }

  Future<void> fetchUpdatedData() async {
    try {
      List updatedWorkSent = await getUniqueWork(User.workSent);
      List updatedWorkReceived = await getUniqueWork(User.workReceived);

      // Update the existing lists with the unique entries
      User.workSent = updatedWorkSent;
      User.workReceived = updatedWorkReceived;

      // Notify listeners that the data has been updated
      notifyListeners();
    } catch (error) {
      // Handle errors, log, or notify the UI about the error
      print('Error fetching updated data: $error');
    }
  }

  Future getUniqueWork(workList) async {
    Set<String> uniqueIds = Set<String>();
    List uniqueWork = [];

    for (Map entry in workList) {
      String userId = entry['userid'].toString();

      if (!uniqueIds.contains(userId)) {
        uniqueWork.add(entry);
        uniqueIds.add(userId);
      }
    }

    return uniqueWork;
  }
}
