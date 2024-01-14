List<int> range(int startNum, int finishNum) {
  if (startNum <= finishNum) {
    return List<int>.generate(
        finishNum - startNum + 1, (index) => startNum + index);
  } else {
    return List<int>.generate(
        startNum - finishNum + 1, (index) => startNum - index);
  }
}

void main() {
  print(range(1, 10)); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print(range(11, 18)); // [11, 12, 13, 14, 15, 16, 17, 18]
}
