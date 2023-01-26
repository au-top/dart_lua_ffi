import 'dart:ffi' as ffi;
import 'package:dart_lua_ffi/generated_bindings.dart';

LuaFFIBind createLua(String luaDLLPath) {
  return LuaFFIBind(ffi.DynamicLibrary.open(luaDLLPath));
}
