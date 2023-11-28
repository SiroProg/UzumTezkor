import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('uz')
  ];

  /// No description provided for @korzinka.
  ///
  /// In ru, this message translates to:
  /// **'Корзина'**
  String get korzinka;

  /// No description provided for @sum.
  ///
  /// In ru, this message translates to:
  /// **'сум'**
  String get sum;

  /// No description provided for @bepulDostavka.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатная доставка'**
  String get bepulDostavka;

  /// No description provided for @kOplate.
  ///
  /// In ru, this message translates to:
  /// **'К оплате'**
  String get kOplate;

  /// No description provided for @stomoist.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость доставки'**
  String get stomoist;

  /// No description provided for @do99000.
  ///
  /// In ru, this message translates to:
  /// **'До 99 000 сум'**
  String get do99000;

  /// No description provided for @s4900.
  ///
  /// In ru, this message translates to:
  /// **'4 900 сум'**
  String get s4900;

  /// No description provided for @ot99000.
  ///
  /// In ru, this message translates to:
  /// **'От 99 000 сум'**
  String get ot99000;

  /// No description provided for @bepul.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатно'**
  String get bepul;

  /// No description provided for @detail.
  ///
  /// In ru, this message translates to:
  /// **'Детали'**
  String get detail;

  /// No description provided for @miniSumZakaz.
  ///
  /// In ru, this message translates to:
  /// **'Минималная сумма закаса'**
  String get miniSumZakaz;

  /// No description provided for @s30000.
  ///
  /// In ru, this message translates to:
  /// **'30 000 сум'**
  String get s30000;

  /// No description provided for @udalit.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get udalit;

  /// No description provided for @obnovit.
  ///
  /// In ru, this message translates to:
  /// **'Обновить'**
  String get obnovit;

  /// No description provided for @tutPusto.
  ///
  /// In ru, this message translates to:
  /// **'Тут пусто'**
  String get tutPusto;

  /// No description provided for @vernites.
  ///
  /// In ru, this message translates to:
  /// **'Вернитесь назад и вқберите что-нибудь вкусное'**
  String get vernites;

  /// No description provided for @dom.
  ///
  /// In ru, this message translates to:
  /// **'Дом'**
  String get dom;

  /// No description provided for @yeshyo.
  ///
  /// In ru, this message translates to:
  /// **'Еще'**
  String get yeshyo;

  /// No description provided for @restorani.
  ///
  /// In ru, this message translates to:
  /// **'Рестораны'**
  String get restorani;

  /// No description provided for @cart.
  ///
  /// In ru, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @profil.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profil;

  /// No description provided for @poisk.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get poisk;

  /// No description provided for @s3040min.
  ///
  /// In ru, this message translates to:
  /// **'30 - 40 мин'**
  String get s3040min;

  /// No description provided for @istoriyaZakaz.
  ///
  /// In ru, this message translates to:
  /// **'История заказов'**
  String get istoriyaZakaz;

  /// No description provided for @promo.
  ///
  /// In ru, this message translates to:
  /// **'Промокоды'**
  String get promo;

  /// No description provided for @pomosh.
  ///
  /// In ru, this message translates to:
  /// **'Помощь'**
  String get pomosh;

  /// No description provided for @til.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get til;

  /// No description provided for @politika.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get politika;

  /// No description provided for @polzova.
  ///
  /// In ru, this message translates to:
  /// **'Пользовательское Соглашение'**
  String get polzova;

  /// No description provided for @chiqish.
  ///
  /// In ru, this message translates to:
  /// **'Выход'**
  String get chiqish;

  /// No description provided for @kirish.
  ///
  /// In ru, this message translates to:
  /// **'Войти/Зарегистрироваться'**
  String get kirish;

  /// No description provided for @persInfo.
  ///
  /// In ru, this message translates to:
  /// **'Персональная информация'**
  String get persInfo;

  /// No description provided for @name.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get name;

  /// No description provided for @number.
  ///
  /// In ru, this message translates to:
  /// **'Число'**
  String get number;

  /// No description provided for @kakUmer.
  ///
  /// In ru, this message translates to:
  /// **'Как курьер может обратиться к вам'**
  String get kakUmer;

  /// No description provided for @chtobi.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы изменить номер телефона'**
  String get chtobi;

  /// No description provided for @soxranit.
  ///
  /// In ru, this message translates to:
  /// **'Сохранять'**
  String get soxranit;

  /// No description provided for @numPhone.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get numPhone;

  /// No description provided for @kod.
  ///
  /// In ru, this message translates to:
  /// **'Код'**
  String get kod;

  /// No description provided for @otmen.
  ///
  /// In ru, this message translates to:
  /// **'Отменить'**
  String get otmen;

  /// No description provided for @neNayd.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get neNayd;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return AppLocalizationsRu();
    case 'uz': return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
