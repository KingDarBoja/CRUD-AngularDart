import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

// Firebase Credentials
import 'firebase.dart';

// Models
import './models/user.model.dart';

@Component(
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: [
      'package:angular_components/app_layout/layout.scss.css',
      './app.component.css'
    ],
    directives: [
      formDirectives,
      MaterialButtonComponent,
      MaterialIconComponent,
    ],
    providers: [
      materialProviders
    ])
class AppComponent implements OnInit {
  var userList = <UserApi>[];
  var title = 'AngularDart';

  @override
  ngOnInit() {
    initializeApp(
        apiKey: firebaseConfigMap['apiKey'],
        authDomain: firebaseConfigMap['authDomain'],
        databaseURL: firebaseConfigMap['databaseURL'],
        projectId: firebaseConfigMap['projectId'],
        storageBucket: firebaseConfigMap['storageBucket'],
        messagingSenderId: firebaseConfigMap['messagingSenderId']);

    fs.Firestore store = firestore();
    fs.CollectionReference ref = store.collection("usuarios");

		ref.onSnapshot.listen((querySnapshot) {
			querySnapshot.docChanges().forEach((change) {
				if (change.type == "added") {
					print(change.doc.data());
					userList.add(UserApi.fromMap(change.doc.data()));
				}
			});
		});
		// print(UserApi('King', 'Dart', '1995-02-02', 'test@test.com', 1141414, 104));
  }
}
