// class Student {
//   String name;
//   String studentId;
//   double score;

//   Student(this.name, this.studentId, this.score);

//   void displayInfo() {
//     print("Name: $name");
//     print("Student ID: $studentId");
//     print("score: $score");
//   }

//   bool isPassed() {
//     return score > 70;
//   }  
// }

// void main() {
//   Student student = Student("John Doe", "12345", 85.0);

//   // Menampilkan informasi mahasiswa
//   student.displayInfo();

//   // Menentukan apakah siswa lulus atau tidak
//   if (student.isPassed()) {
//     print("Mahasiswa lulus!");
//   } else {
//     print("Mahasiswa tidak lulus.");
//   }
// }

// class PersegiPanjang {
//   double panjang;
//   double lebar;

//   PersegiPanjang({required this.panjang, required this.lebar});

//   double hitungLuas() {
//     return panjang * lebar;
//   }

//   double hitungKeliling() {
//     return 2 * (panjang + lebar);
//   }
// }

// void main() {
//   PersegiPanjang persegiPanjang1 = PersegiPanjang(panjang: 5, lebar: 6);
//   print('Luas: ${persegiPanjang1.hitungLuas()}');
//   print('Keliling: ${persegiPanjang1.hitungKeliling()}');

//   PersegiPanjang persegiPanjang2 = PersegiPanjang(panjang: 7, lebar: 8);
//   print('Luas: ${persegiPanjang2.hitungLuas()}');
//   print('Keliling: ${persegiPanjang2.hitungKeliling()}');
// }

//Buatlah kelas Buku dengan atribut judul, penulis, dan tahun terbit. Berikan method untuk menampilkan informasi buku.
