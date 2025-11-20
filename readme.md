$ANDROID_SDK_ROOT/emulator/emulator -avd Pixel_4_API_35 -partition-size 4096
flutter run -d bemfifwcqsibfelj

rm -rf ~/.android/cache
rm -rf ~/.cache/android
rm -rf ~/.cache/Google/AndroidEmulator
rm -rf ~/.cache/AndroidEmulator

clean cache
rm -rf ~/.gradle/caches/
rm -rf ~/.gradle/daemon/
rm -rf ~/.gradle/native/
rm -rf ~/.gradle/wrapper/

cd ~/dery/SAS/alumni_app
flutter clean
rm -rf build/
rm -rf .dart_tool/
rm -rf .gradle/
rm -rf android/.gradle/

flutter pub cache clean

flutter run -d bemfifwcqsibfelj
