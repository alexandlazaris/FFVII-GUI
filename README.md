# FFVII-GUI

A Flutter app built to re-imagine the original FFVII.

- [FFVII-GUI](#ffvii-gui)
    - [packages](#packages)
- [Progress](#progress)
  - [required 1.0 features](#required-10-features)
  - [Building](#building)
    - [Data](#data)
    - [Web](#web)
    - [Mobile](#mobile)
    - [Desktop](#desktop)
  - [project structure](#project-structure)
  - [resources](#resources)
  - [findings](#findings)


### packages

- `riverpod`: state management
- `dio`: HTTP client
- `riverpod_lint` + custom_lint: simplify code + provide riverpod usage improvements
- `custom_mouse_cursor`: used to mimic original glove cursor (desktop only)
- `package_info_plus`: used to obtain app install + version info.

# Progress

> [!WARNING]
> FF7 web/mobile/desktop app is still in development. You have been warned.

| desktop | mobile |
| --- | --- | 
|   ![img](assets/ffvii-demo-desktop.png)  |   ![img](assets/ffvii-demo-mobile.png)  |

## required 1.0 features

- launch a start screen ✅
- select new game ✅
  -  create a new save slot, and ✅ 
     -  list availabe party members ✅
     -  select a save location ✅
- select continue ✅
  - list all the found save slots from API ✅
    - show the party members, lead member + lead level, save location ✅
  - list a maximum of 15 slots ✅
  - show EMPTY is no save slot is found ✅
  - select a slot to load that save 🚧
    - display party base party info on a new screen

## Building

### Data

Use `config.template.json` to pass in custom settings into the app. 

### Web

`flutter run -d web-server --web-port=7778 --dart-define-from-file=config.prod.json`

### Mobile

`flutter build apk --dart-define-from-file=config.prod.json`

### Desktop

`flutter build macos`

> [!TIP]
> use `flutter run` to run the app against the 1st connected device (or shown a prompt to choose)

## project structure

```
assets
lib
├── models
├── pages
├── providers
├── repository
├── services
└── widgets
widgetbook
```
## resources

A big thank-you to the fantastic resources & FF communities below:

- https://www.spriters-resource.com/pc_computer/finalfantasy7/asset/39057/
- https://fontstruct.com/fontstructions/show/1172363/reactor7


## findings

- use Containers to colour widget areas on screen, use these coloured boxes to help shape & size your layout easily. Once you have your layout as desired across mobile/desktop,then replace with your real widgets
- split up widgets that are reusable, make modular widgets but also keep widgets specific. Not everything has to be a single, atomic entity
- test on real device, don't trust simulator
- ~~enable internet permissions for Mac, android, ios apps~~
- ~~enable CORS on API server~~
- a black icon app was having different effects on android
- riverpod guide: https://codewithandrea.com/articles/flutter-state-management-riverpod/