void main(List<String> args) {
  print("life");
  
  Future.delayed(Duration(seconds: 1), () => "is")
    .then((result) => print(result))
    .then((_) => Future.delayed(Duration(seconds: 1), () => "never flat"))
    .then((result) => print(result));
}
