import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: [
      'package:angular_components/app_layout/layout.scss.css',
      './app.component.css'
    ],
    directives: [
      MaterialButtonComponent,
      MaterialIconComponent,
    ],
    providers: [
      materialProviders
    ])
	
class AppComponent {
  var title = 'AngularDart';
}
