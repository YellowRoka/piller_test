# piller_test

# GENERAL HELPS:
flutter create .
dart pub get
dart run build_runner build -d
dart run easy_localization:generate -S assets/translations  -f keys -o locale_keys.g.dart
//import 'generated/locale_keys.g.dart';

# Main requirements:
- Kérlek írj egy alkalmazást, aminek három képernyője van.
- Az első egy login képernyő, ahol felhasználónév és jelszó megadása után be tudunk lépni az alkalmazásba. 
- Belépést követően egy tetszőleges publikus Api felhasználával töltsünk be valamilyen listát (2-3 adat elég, előny ha kép is van) és jelenítsük meg.
- A lista egy elemére kattintva navigáljunk egy részletező oldalra, ahol az adott elem részletes adatai láthatóak.
- A listán legyen lehetőség kijelölni kedvenc elemeket, továbbá legyen egy szűrő gomb, ami csak a kedvenceket mutatja.

- A bejelentkező képernyő a user: „Piller” és password: „PillerPassword” párosra engedjen tovább, egyéb esetben jelezze, hogy nem helyesek az adatok.
- A bejelentkezés logikája lehetőleg ne csupán két String összehasonlítása legyen, hanem minél inkább hasonlítson egy valós login API használatára.

- Természetesen bármilyen plusz funkciót is meg lehet valósítani. Amit figyelni fogunk az a kód minősége.

# Used recommanded architeture:
https://docs.flutter.dev/app-architecture/guide
