import 'package:firebase_database/firebase_database.dart';
import 'package:todo_list/pages/authPages/auth.dart';
import 'package:todo_list/provider/authProvider.dart';

final databaseReference = FirebaseDatabase.instance.reference();

void createData(String title, String description, int importance, int duration,
    DateTime deadline, String backgroundColor) {
  int _dataLength = 0;
  databaseReference.child(login).once().then((DataSnapshot snapshot) {
    if (snapshot.value != null) _dataLength = snapshot.value.length;
    databaseReference.child(login).child((_dataLength).toString()).set({
      'title': title,
      'description': description,
      'importance': importance,
      'duration': duration,
      'deadline': deadline.toString(),
      'color': backgroundColor
    });
    AuthProvider().getData();
  });
}
