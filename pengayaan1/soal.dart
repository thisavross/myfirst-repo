 void main(){
    //1. int adalah variabel yang berisi bilangan bulat sedangkan float berisi data desimal
//3.
void main() {
  var sentence = "I am going to be Flutter Developer";

  var exampleFirstWord = sentence.split(' ')[0];
  var exampleSecondWord = sentence.split(' ')[1];
  var thirdWord = sentence.split(' ')[2];
  var fourthWord = sentence.split(' ')[3];
  var fifthWord = sentence.split(' ')[4];
  var sixthWord = sentence.split(' ')[5];
  var seventhWord = sentence.split(' ')[6];

  print('First word: ' + exampleFirstWord);
  print('Second word: ' + exampleSecondWord);
  print('Third word: ' + thirdWord);
  print('Fourth word: ' + fourthWord);
  print('Fifth word: ' + fifthWord);
  print('Sixth word: ' + sixthWord);
  print('Seventh word: ' + seventhWord);
}

//soal no 2
var word = 'dart';
var second = 'is';
var third = 'awesome';
var fourth = 'and';
var fifth = 'I';
var sixth = 'love';
var seventh = 'it!';
print(word+second+third+fourth+fifth+sixth+seventh);

//soal no 4
import 'dart:io';

void main() {
  stdout.write('Masukkan nama depan: ');
  String firstName = stdin.readLineSync();

  stdout.write('Masukkan nama belakang: ');
  String lastName = stdin.readLineSync();

  String fullName = '$firstName $lastName';
  
  print('Nama lengkap anda adalah: $fullName');
}

//soal no 5
void main(){
    int a=5;
    int b=10;
    print(a+b);
    print(a*b);print(a-b);print(a/b);
}

