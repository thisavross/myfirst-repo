import 'dart:async';

Future<void> main() async {
 print('Ready. Sing.');

 await Future.delayed(Duration(seconds: 5));
 print('( )');

 await Future.delayed(Duration(seconds: 3));
 print('( )');

 await Future.delayed(Duration(seconds: 2));
 print('( )');

 await Future.delayed(Duration(seconds: 1));
 print('( )');
}