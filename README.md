
## Features

use dart ffi link lua dynamic lib 

## Getting started

there is no dynamic link library file containing lua here

need users to download

version `5.4` is currently supported here

## Usage


```dart
    final assetsPath="assets/";
    final luaFFI = LuaFFI(dynamicLibraryPath: "${assetsPath}lua54.dll");
    final lp = luaFFI.luaLNewState();
    luaFFI.luaOpenLibs(lp);
    luaFFI.luaLLoadString(lp, "print(\"HelloWorld I'm Lua\")".toNativeUtf8());
    luaFFI.luaPcallK(lp, 0, -1, 0, LUA_MULTRET, 0);
```

Check the example folder in the warehouse and place the required Lua dynamic link file in the assets folder to run the example



## Additional information

There are two assets files

In the test folder and example folder respectively

To run the code, place the lua dll file in these two folders

This is a simple and concise use of dart ffi api call lua dynamic lib file to run lua, so please modify and add link lua dynamic lib code as needed