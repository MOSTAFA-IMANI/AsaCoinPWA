import 'dart:convert';

import 'package:asacoine/src/model/AppBanner.dart';
import 'package:asacoine/src/model/Feature.dart';
import 'package:asacoine/src/model/ResponseNetwork.dart';
import 'package:dio/dio.dart';

import '../../../generated/assets.dart';
import '../../model/Possibility.dart';
import '../../model/Symbol.dart';

class HomeRepository {
  static HomeRepository? _instance;

  static HomeRepository getInstance() {
    _instance ??= HomeRepository();

    return _instance!;
  }

  List<Feature> getFeatureOfExchange() {
    return [
      Feature(
        Assets.iconsAdvanceTransaction,
        "معاملات پیشرفته",
        "https://panel.asacoine.com/panel/simple/trade/?pairSymbol=BTC-USDT",
        true,
      ),
      Feature(
        Assets.iconsRealTime,
        "معاملات آنی",
        "https://panel.asacoine.com/panel/simple/trade/?pairSymbol=BTC-USDT",
        true,
      ),
      Feature(
        Assets.iconsWalletMoney,
        "کیف پول",
        "https://panel.asacoine.com/panel/wallets/",
        true,
      ),
      Feature(
        Assets.iconsAirdrop,
        "ایردراپ",
        "https://t.me/zeehnpolsaz",
        false,
      ),
      Feature(
        Assets.iconsReceived,
        "واریز",
        "https://panel.asacoine.com/panel/wallets/",
        true,
      ),
      Feature(
        Assets.iconsPayment,
        "استیکینگ",
        "https://panel.asacoine.com/panel/staking/",
        true,
      ),
      Feature(
        Assets.iconsAsaVam,
        "آساوام",
        "https://panel.asacoine.com/panel/loan/",
        true,
      ),
      Feature(
        Assets.iconsFaucet,
        "فاست",
        "https://panel.asacoine.com/panel/fast/",
        true,
      ),
    ];
  }

  List<Possibility> getPossibilities() {
    return [
      Possibility(
        Assets.iconsBinoculars,
        "امکانات پیشرفته برای معاملات",
        "ابزارهای مدرن برای انجام معاملات از جمله حد سود و ضرر، پنل گزارش سود و زیان، امکان تنظیم هشدار قیمت و همچنین نمودارهای قیمتی و ابزارهای تحلیل بازار در اختیار شماست.",
      ),
      Possibility(
        Assets.iconsChart,
        "لیست کردن انواع رمز ارز",
        "علاوه بر سادگی محیط کاربری، امنیت و سرعت بالا درکلیه تراکنش ها ، آساکوین تنها صرافی در بازار می باشد که هر نوع رمز ارزی را به در خواست مشتریان فراهم میکند.",
      ),
      Possibility(
        Assets.iconsWallet,
        "کیف‌ پول اختصاصی",
        "دارایی‌های شما در کیف‌ پول اختصاصی به صورت سرد نگه ‌داری می‌شود و دربرابر حمله‌های مختلف امنیت بالایی دارد.",
      ),
      Possibility(
        Assets.iconsShield,
        "سپرهای امنیتی مدرن",
        "تیم امنیتی پیشرفته آساکوین با ابزارهای مدرن و به‌روز، همواره برای حفظ امنیت دارایی کاربران تلاش می‌کنند. ذخیره امن دارایی کاربران در کیف پول‌های سرد و تایید هویت دو عاملی از جمله این ابزارها هستند.",
      ),
      Possibility(
        Assets.iconsVariety,
        "تنوع کوین و سبد معاملات",
        "معامله‌ی بهترین کوین‌های بازار در سه پایه بازار متفاوت و متنوع‌تر شدن سبد معاملات، یک ویژگی مهم برای کاربران حرفه‌ای است.",
      ),
      Possibility(
        Assets.iconsAuth,
        "احراز هویت سریع",
        "در صرافی آساکوین، در کمتر از پنج دقیقه ثبت نام و معامله در پرسودترین بازارها را آغاز کنید.",
      ),
      Possibility(
        Assets.iconsSupport,
        "پشتیبانی حرفه‌ای",
        "پشتیبانی حرفه‌ای و ۲۴ ساعته‌ی آنلاین و تلفنی آساکوین، خیال کاربران را برای پاسخ به هر سوالی آسوده می‌کند.",
      ),
    ];
  }

  Future<List<Symbol>> getPopularSymbol() async {
    final response = await Dio().get(
        "https://api.asacoine.com/api/v1/exchange/symbols?page=1&limit=5&order=1");
    int count = response.data["pagination"]["limit"];
    List<Symbol> symbolList = [];
    for (int i = 0; i < count; i++) {
      String icon = response.data["result"][i]["baseCurrency"]["image"];
      String name = response.data["result"][i]["fullName"];
      double price = response.data["result"][i]["buy"];
      double changeRate =
      double.parse(response.data["result"][i]["changeRate"].toString());
      Symbol symbol = Symbol(icon, name, price, changeRate);
      symbolList.add(symbol);
    }
    return symbolList;
  }


  Future<ResponseNetwork<List<AppBanner>>> getBanners() async {
    try {
      final response = await Dio().get(
          "http://rymon-afzar.ir/google-play/asacoine/api/android-home-banner.json");

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> bannersJson = jsonData['banners'];

      List<AppBanner> banners =
      bannersJson.map((json) => AppBanner.fromJson(json)).toList();

      ResponseNetwork<List<AppBanner>> responseNetwork =
      (response.statusCode == 200)
          ? ResponseNetwork(banners, true)
          : ResponseNetwork(<AppBanner>[], false);

      return responseNetwork;
    } on DioException catch (e) {
      return ResponseNetwork(<AppBanner>[], false);
    }
  }
}
