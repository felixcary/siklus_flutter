# siklus_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Answer:

1. For task no 1 I've research for large data sets the insertion sort is the fastest 
```
void main() {
  List<int> listOfHeight = [20,120,121,132,123,220,192,179,20,198,125,140,123,210];
  
  for (var i = 0; i < listOfHeight.length; i++) {
    var j = i;

    while (j > 0 && listOfHeight[j] < listOfHeight[j - 1]) {
      var temp = listOfHeight[j];
      listOfHeight[j] = listOfHeight[j-1];
      listOfHeight[j-1] = temp;
      j--;
    }
  }
  print(listOfHeight);
}
                                                    
//regular sort from flutter
void main() {
  List<int> listOfHeight = [20,120,121,132,123,220,192,179,20,198,125,140,123,210];
  listOfHeight.sort();
  print(listOfHeight);
}
```
2. For task no 2

This application has been tested on Android Redmi 9 (Android 10, MIUI 11) and iPhone XR (iOS 14.5).
Minimum Requirement:
Android SDK 16 (Android 4.1)
iOS 9.0
  
Recommended Requirement:
Android SDK 27 (Android 8.1)
iOS 13

BLoC for state management https://pub.dev/packages/flutter_bloc
  
Instruction to build and run app:

- download the project and open using visual studio code
- go to pubspec.yaml and run "flutter pub get" to download required library
- run it on simulator or real device
