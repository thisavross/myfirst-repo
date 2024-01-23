class Segitiga{
  double alas;
  double tinggi;
Segitiga({required this.alas, required this.tinggi});
  
  double hitungLuas(){
    return tinggi*alas/2;
  }
}
void main() {
  Segitiga segitiga = Segitiga(alas:20.0, tinggi:30.0);
  print(segitiga.hitungLuas());
}