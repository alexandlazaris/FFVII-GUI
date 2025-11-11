# FFVII-GUI

A Flutter app built to re-imagine the original FFVII.

- [FFVII-GUI](#ffvii-gui)
    - [packages](#packages)
  - [progress](#progress)
  - [required 1.0 features](#required-10-features)
  - [supported platforms](#supported-platforms)
  - [building](#building)
  - [project structure](#project-structure)
  - [assets](#assets)


### packages

- `riverpod`: state management
- `dio`: HTTP client
- `riverpod_lint` + custom_lint: simplify code + provide riverpod usage improvements

## progress

![gif](assets/FFVII-GUI-save-slots-v1.gif)

## required 1.0 features

- launch a start screen ✅
- select new game
  -  create a new save slot, and 
     -  list availabe party members
     -  select a save location
     -  display party base party info on a new screen
- select continue ✅
  - list all the found save slots from API ✅
    - show the party members, lead member + lead level, save location ✅
  - list a maximum of 15 slots
  - show EMPTY is no save slot is found ✅
  - select a slot to load that save
    - display party base party info on a new screen


## supported platforms

> [!WARNING]
> Mobile and Web are being prioritized. Desktop apps will be assessed at a later point.

- **Web**: 🚧   refactor underway, *was* functional ...
- **iOS**: ✅ good status, api calls functional, UI functional
- **Android**: ✅ good status, api calls functional, UI functional
- **Desktop**: 🚫 Mac cannot make API calls, untested on Linux/Windows

## building

Build app with config: `flutter build apk --dart-define-from-file=config.prod.json`

Run app with config: `flutter run --dart-define-from-file=config.prod.json`


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
```

## assets

- https://www.spriters-resource.com/pc_computer/finalfantasy7/asset/39057/