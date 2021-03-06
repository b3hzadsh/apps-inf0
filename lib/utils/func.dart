class MyFunctions {
  static String remEnd(String andVer) {
    var temp = andVer.split(" ")[0];
    return temp;
  }

  static String sumrize(int k) {
    String temp = k.toString();
    if (temp.length < 3) return temp;

    String resZarib;
    var mainNum = temp.length % 3;
    var resStr =
        (mainNum == 0) ? temp.substring(0, 2) : temp.substring(0, mainNum);

    if (temp.length < 4) resStr = temp;

    // temp.substring(0, mainNum - 1);
    switch ((temp.length ~/ 3)) {
      case 1:
        if (temp.length > 3)
          resZarib = "K";
        else
          resZarib = "";

        break;
      case 2:
        if (temp.length > 6)
          resZarib = "M";
        else
          resZarib = "K";

        break;
      case 3:
        if (temp.length > 9)
          resZarib = "B";
        else
          resZarib = "M";

        break;
      default:
    }

    return resStr + resZarib;
  }

  static String shortener(String input) {
    int lenght = input.length;
    if (lenght > 6) {
      return input.split(" ")[0];
    } else {
      return input.split("M")[0] + "M";
    }
  }

  static String shortenerName(String input) {
    if (input.length < 35) return input;
    if (input.split("-")[0].length < 20) return input.split("-")[0];
    if (input.split(":")[0].length < 20)
      return input.split(":")[0];
    else
      return input.split(" ")[0] +
          " " +
          input.split(" ")[1] +
          " " +
          input.split(" ")[2] +
          " ...";
  }
}
