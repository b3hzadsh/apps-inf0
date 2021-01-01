import 'package:test/test.dart';
import 'package:apps_info/utils/func.dart';

void main() {
  test(
      'App name should be a short name and almost good represent of the full name',
      () {
    expect(MyFunctions.shortenerName("Pip camera"), "Pip camera");
    expect(MyFunctions.shortenerName("Texagram- writes ..."),
        "Texagram- writes ...");
    expect(
        MyFunctions.shortenerName(
            "Canva: poster , banner , card poster , banner , card  ..."),
        "Canva");
    expect(MyFunctions.shortenerName("Photo Editor"), "Photo Editor");
    //expect(MyFunctions.shortenerName("Pip camera"), "Pip camera");
  });
  test('Review should be brief', () {
    expect(MyFunctions.sumrize(7321), "7K");
    expect(MyFunctions.sumrize(321), "321");
    expect(MyFunctions.sumrize(61), "61");
    expect(MyFunctions.sumrize(2), "2");
    expect(MyFunctions.sumrize(22348), "22K");
    expect(MyFunctions.sumrize(7000321), "7M");
  });
  test('Android version should be one word or all the digits', () {
    expect(MyFunctions.remEnd("4.0.3 and up"), "4.0.3");
    expect(MyFunctions.remEnd("Varies with device"), "Varies");
  });
  test('Size should be double + "M" or Varies ', () {
    expect(MyFunctions.shortener("Varies with device"), "Varies");
    expect(MyFunctions.shortener("1.2M"), "1.2M");
  });
} /* 
"Size": "Varies with device",
"Size": "24M",
"Size": "9.4M", */
