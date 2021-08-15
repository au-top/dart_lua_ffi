import 'package:dart_lua_ffi/dart_lua_ffi.dart';
import 'package:test/test.dart';
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

void main() {
  final assetsPath = "test/assets/";

  group('A group of tests', () {
    LuaFFI? luaFFI;
    setUp(() {
      // Additional setup goes here.
      luaFFI = LuaFFI(dynamicLibraryPath: "${assetsPath}lua54.dll");
    });

    test('test_load_dll_init', () {
      expect(luaFFI != null, isTrue);
    });

    test('First Test', () {
      final lp = luaFFI!.luaLNewState();

      luaFFI!.luaOpenLibs(lp);
      luaFFI!.luaLoadFile(lp, "${assetsPath}hw.lua".toNativeUtf8(), 0);
      luaFFI!.luaPushNumber(lp, 1.2);
      luaFFI!.luaSetGlobal(lp, "dartvar".toNativeUtf8());
      luaFFI!.luaPcallK(lp, 0, -1, 0, LUA_MULTRET, 0);
      luaFFI!.luaSetTop(lp, 0);
      luaFFI!.luaGetGlobal(lp, "helloworldCall".toNativeUtf8());
      luaFFI!.luaPcallK(lp, 0, -1, 0, LUA_MULTRET, 0);
      expect(luaFFI!.luaLLoadString(lp, "print(\"from dart print \")".toNativeUtf8()) == LUA_OK, isTrue);
      luaFFI!.luaPcallK(lp, 0, -1, 0, LUA_MULTRET, 0);
      expect(luaFFI!.luaLLoadString(lp, "print(\"from dart print \"".toNativeUtf8()) == LUA_ERRSYNTAX, isTrue);
    });
  });
}
