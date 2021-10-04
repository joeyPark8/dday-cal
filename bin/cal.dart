class Calculator {
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

    if (year > now.year) { //not this year
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
    } else { //this year
      if (now.month < month) { //not this month
        //add dates of full month
        int i = now.month + 1;
        while (i < month) {
          leftDay += (callender[i] as num);

          i += 1;
        }

        //add rest dates
        leftDay += date;

        //add rest dates of this month
        leftDay += ((callender[i] as num) - now.day);

        leftDay -= 1;
      } else { //this month
        leftDay = date - now.day;
      }
    }

    if (year > now.year) {
      for (var i = now.year + 1; i < year; i += 1) {
        if (_isLeapYear(i)) {
          leftDay += 1;
        }
      }

      if (_isLeapYear(year)) {
        if (month > 2) {
          leftDay += 1;
        }
      }
    } else {
      if (_isLeapYear(now.year)) {
        if (month < 3) {
          if (date < 29) {
            leftDay += 1;
          }
        }
      }
    }

    return leftDay;
  }

  _isLeapYear(var year) {
    if (year % 4 == 0 && year % 100 != 0) {
      return true;
    }
    else if (year % 400 == 0) {
      return true;
    }

    return false;
  }
}