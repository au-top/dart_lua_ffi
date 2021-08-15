import 'package:dart_lua_ffi/dart_lua_ffi.dart';
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

const dartPrintPrefix = "dartLog: ";
void main() {
  final assetsPath = "assets/";
  final luaFFI = LuaFFI(dynamicLibraryPath: "${assetsPath}lua54.dll");
  final lp = luaFFI.luaLNewState();
  luaFFI.luaOpenLibs(lp);
  luaFFI.luaLoadFile(lp, "${assetsPath}hw.lua".toNativeUtf8(), 0);
  luaFFI.luaPushNumber(lp, 1.2);
  luaFFI.luaSetGlobal(lp, "dartvar".toNativeUtf8());
  luaFFI.luaPcallK(lp, 0, -1, 0, LUA_MULTRET, 0);
  luaFFI.luaSetTop(lp, 0);
  luaFFI.luaGetGlobal(lp, "helloworldCall".toNativeUtf8());
  luaFFI.luaPcallK(lp, 0, 1, 0, LUA_MULTRET, 0);
  {
    final runFunctionResult = luaFFI.luaToNumberX(lp, 0, C_NULL_POINTER);
    print("$dartPrintPrefix run function return result value  ${runFunctionResult}");
  }
  // LuaPrintPrefix definition in  [assets/hw.lua]  file
  luaFFI.luaLLoadString(lp, "print(LuaPrintPrefix..\"from dart print \")".toNativeUtf8());
  luaFFI.luaPcallK(lp, 0, -1, 0, LUA_MULTRET, 0);
  {
    final fromStringLoadCodeResult = luaFFI.luaLLoadString(lp, "print(\"from dart print \"".toNativeUtf8());
    print("$dartPrintPrefix load error return number value : ${fromStringLoadCodeResult}");
  }
}
