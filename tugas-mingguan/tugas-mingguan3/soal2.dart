import 'dart:async';

void main(List<String> args) async {
  var h = Human();

  print("zoro");
  print("luffy");
  print("killer");
  await h.getDataAsync();
  print(h.name);
}

class Human {
  String name = "character one piece";

  Future<void> getDataAsync() async {
    await Future.delayed(Duration(seconds: 3)); // Menunggu 3 detik secara asynchronous
    name = "hilmy";
    print("get data [done]");
  }
}
