//a. soal 1 buatlah sebuah kondisi dimana apabila toko buka maka saya akan membeli telur dan apabila tutup maka saya akan datang lagi esok hari
void main() {
  String toko = buka;
  if (toko == buka) {
    print("saya akan membeli telur");
  }
  else {
    print("saya akan datang lagi esok")
  }
}

//b.Jika nilai lebih besar atau sama dengan 80, keterangan adalah "A: Sangat Baik".
// Jika nilai antara 70 dan 79, keterangan adalah "B: Baik".
// Jika nilai antara 60 dan 69, keterangan adalah "C: Cukup".
// Jika nilai antara 50 dan 59, keterangan adalah "D: Kurang".
// Jika nilai kurang dari 50, keterangan adalah "E: Sangat Kurang".
void main (){
int score = 90;
if(score >= 80){
  print("sangat baik");
}
else if (score >=70 && score <= 79){
  print("baik");
}
else if(score >=60 && score <= 69){
  print("cukup");
}
else if(score >=50 && score <=59){
  print("kurang");
}
else {
  print("sangat kurang");
}
}


//a. Dengan menggunakan For Loop Buatlah program yang mencetak deret angka dari 1 hingga 10, baik secara berurutan maupun secara terbalik. Gunakan struktur pengulangan untuk mencapai hal ini.
for (i=0; 1<=10; i++){
  
}

for (i=10; i<0; i--){

}

//Dengan menggunakan While loop Buatlah program yang mencetak deret angka dari 1 hingga 10, baik secara berurutan maupun secara terbalik. Gunakan struktur pengulangan untuk mencapai hal ini.
int a=1;
while(a<11){
  print (a);
  a++;
}

int b =10;
while(b>1){
  print (b);
  b--
}

//a. Buatlah program untuk menghitung luas dan keliling Persegi panjang berdasarkan yang diberikan. Gunakan fungsi untuk melakukan perhitungan luas dan keliling.

  print("input panjang persegi: ");
  int panjang = int.parse(stdin.readLineSync()!);
  print("input lebar persegi");
  int lebar = int.parse(stdin.readLineSync()!);

  int Luas (int panjang, int lebar){
    return panjang * lebar;
  }
  int keliling (int panjang, int lebar){
    return 2*(panjang + lebar);
  }

  print ("luas persegi: $Luas);
  print(keliling persegi: $keliling);

  //soal no 4
  void printStudentInfo(String name, int age, String major) {
  print("Informasi Mahasiswa:");
  print("Nama: $name");
  print("Usia: $age tahun");
  print("Jurusan: $major");
}

void main() {

  String studentName = "hartati";
  int studentAge = 20;
  String studentMajor = "Teknik Informatika";

  
  printStudentInfo(studentName, studentAge, studentMajor);
}
