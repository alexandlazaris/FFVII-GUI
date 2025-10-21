# FFVII-GUI

A flutter app built to re-imagining FFVII.

## initial setup tasks
- semantic release versioning (using a flutter native approach)
- unit tests
- required dependencies
- target flutter version


## supported platforms

- Desktop (Mac, Windows, Linux)
- Web (Chrome, Firefox)

> [!CAUTION]
> Is runnable on android/ios however the app is not *yet* gracefully handling smaller screensizes.

## dependencies
- state management? riverpod
- auth? none

## required 1.0 features

![img](assets/main-menu.png)

- launch a start screen ✅
- select new game
  -  create a new save slot, and 
     -  list availabe party members
     -  select a save location
     -  display party base party info on a new screen
- select continue
  - list all the found save slots from API
  - list a maximum of 15 slots
  - show EMPTY is no save slot is found
  - select a slot to load that save
    - display party base party info on a new screen