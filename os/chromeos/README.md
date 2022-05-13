# Chrome OS

## Sideload Android apps

1. Enable ADB debugging

> chrome://os-settings/crostini/androidAdb

2. Install SDK Platform Tools on Linux: [platform-tools](https://developer.android.com/studio/releases/platform-tools)

3. Connect terminal to the ARC

```sh
adb connect 100.115.92.2:5555
```

4. Install APK

```sh
adb install $apk_file
```
