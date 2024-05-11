import 'package:asacoine/src/model/Feature.dart';
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
      Feature(Assets.iconsAdvanceTransaction, "معاملات پیشرفته"),
      Feature(Assets.iconsRealTime, "معاملات آنی"),
      Feature(Assets.iconsWalletMoney, "کیف پول"),
      Feature(Assets.iconsAirdrop, "ایردراپ"),
      Feature(Assets.iconsReceived, "واریز"),
      Feature(Assets.iconsPayment, "استیکینگ"),
      Feature(Assets.iconsAsaVam, "آساوام"),
      Feature(Assets.iconsFaucet, "فاست"),
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
    print(response.data);
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
}
