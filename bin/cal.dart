var callender = <int, num>{
  1: 31,
  2: 28,
  3: 31,
  4: 30,
  5: 31,
  6: 30,
  7: 31,
  8: 31,
  9: 30,
  10: 31,
  11: 30,
  12: 31
};

calculate(int year, int month, int date) {
  var now = new DateTime.now();

  num leftDay = 0;

  if (year > now.year) {
    //add dates of full year
    int leftFullYear = year - now.year - 1;

    leftDay += leftFullYear * 365;

    //add dates of full month
    int i = 1;
    while (i < month) {
      leftDay += (callender[i] as num);

      i += 1;
    }

    //add rest dates
    leftDay += date;

    //add rest dates of full month of this year
    i = now.month + 1;
    while (i < 13) {
      leftDay += (callender[i] as num);

      i += 1;
    }

    //add rest dates of this month
    leftDay += (callender[now.month] as num) - now.day;
  }

  return leftDay;
}

main(List<String> args) {
  print(calculate(2022, 7, 27));
}
