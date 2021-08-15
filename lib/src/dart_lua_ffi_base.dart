import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

///
/// 开头大写 后缀带 [Func] 是 ffi 对应的函数类型
///         不带 [Func] 是对应的 dart 函数类型
typedef LuaNewStateFunc = ffi.NativeFunction<ffi.Pointer Function()>;
typedef LuaNewState = ffi.Pointer Function();
typedef LuaOpenLibsFunc = ffi.NativeFunction<ffi.Void Function(ffi.Pointer)>;
typedef LuaOpenLibs = void Function(ffi.Pointer);
typedef LuaLoadFileFunc = ffi.NativeFunction<ffi.Uint32 Function(ffi.Pointer, ffi.Pointer<Utf8>, ffi.Uint32)>;
typedef LuaLoadFile = int Function(ffi.Pointer, ffi.Pointer<Utf8>, int);
typedef LuaPcallKFunc = ffi.NativeFunction<ffi.Uint32 Function(ffi.Pointer, ffi.Uint32, ffi.Uint32, ffi.Uint32, ffi.Uint32, ffi.Uint32)>;
typedef LuaPcallK = int Function(ffi.Pointer, int, int, int, int, int);
typedef LuaPushNumberFunc = ffi.NativeFunction<ffi.Void Function(ffi.Pointer, ffi.Double)>;
typedef LuaPushNumber = void Function(ffi.Pointer, double);

typedef LuaPushStringFunc = ffi.NativeFunction<ffi.Void Function(ffi.Pointer, ffi.Pointer<Utf8>)>;
typedef LuaPushString = void Function(ffi.Pointer, ffi.Pointer<Utf8>);

typedef LuaPushThreadFunc = ffi.NativeFunction<ffi.Uint32 Function(ffi.Pointer)>;
typedef LuaPushThread = int Function(ffi.Pointer);

typedef LuaRemoveFunc = ffi.NativeFunction<ffi.Void Function(ffi.Pointer, ffi.Uint32)>;
typedef LuaRemove = void Function(ffi.Pointer, int);

typedef LuaSetGlobalFunc = ffi.NativeFunction<ffi.Void Function(ffi.Pointer, ffi.Pointer<Utf8>)>;
typedef LuaSetGlobal = void Function(ffi.Pointer, ffi.Pointer<Utf8>);
typedef LuaGetGlobalFunc = ffi.NativeFunction<ffi.Void Function(ffi.Pointer, ffi.Pointer<Utf8>)>;
typedef LuaGetGlobal = void Function(ffi.Pointer, ffi.Pointer<Utf8>);
typedef LuaSetTopFunc = ffi.NativeFunction<ffi.Void Function(ffi.Pointer, ffi.Uint32)>;
typedef LuaSetTop = void Function(ffi.Pointer, int);
typedef LuaLLoadStringFunc = ffi.NativeFunction<ffi.Uint32 Function(ffi.Pointer, ffi.Pointer<Utf8>)>;
typedef LuaLLoadString = int Function(ffi.Pointer, ffi.Pointer<Utf8>);

typedef LuaToBooleanFunc = ffi.NativeFunction<ffi.Uint32 Function(ffi.Pointer, ffi.Uint32)>;
typedef LuaToBoolean = int Function(ffi.Pointer, int);

typedef LuaToIntegerFunc = ffi.NativeFunction<ffi.Uint64 Function(ffi.Pointer, ffi.Uint32)>;
typedef LuaToInteger = int Function(ffi.Pointer, int);

typedef LuaToStringFunc = ffi.NativeFunction<ffi.Pointer<Utf8> Function(ffi.Pointer, ffi.Uint32)>;
typedef LuaToString = ffi.Pointer<Utf8> Function(
  ffi.Pointer,
  int,
);

typedef LuaToNumberXFunc = ffi.NativeFunction<ffi.Double Function(ffi.Pointer, ffi.Uint32, ffi.Pointer<ffi.Uint32>)>;
typedef LuaToNumberX = double Function(
  ffi.Pointer,
  int,
  ffi.Pointer<ffi.Uint32>,
);

typedef LuaToPointerFunc = ffi.NativeFunction<ffi.Pointer Function(ffi.Pointer, ffi.Uint32)>;
typedef LuaToPointer = ffi.Pointer Function(ffi.Pointer, int);

final C_NULL_POINTER = ffi.nullptr as ffi.Pointer<ffi.Uint32>;

/// is number zero (0)
const NULL = 0;

/// (0)
const LUA_MULTRET = 0;

/// 没有错误 (0)
const LUA_OK = 0;

/// 线程(协程)产生 (1)
const LUA_YIELD = 1;

/// 运行时错误 (2)
const LUA_ERRRUN = 2;

/// 预编译期间的语法错误 (3)
const LUA_ERRSYNTAX = 3;

/// 内存分配错误 对于此类错误Lua 不会调用消息处理程序 (4)
const LUA_ERRMEM = 4;

/// 运行消息处理程序时出错
const LUA_ERRERR = 5;

class LuaFFI {
  /// load dynamic function lib
  late final ffi.DynamicLibrary _dynamicLibrary;

  /// map lua function
  late final LuaNewState luaLNewState = _dynamicLibrary.lookup<LuaNewStateFunc>("luaL_newstate").asFunction();
  late final LuaOpenLibs luaOpenLibs = _dynamicLibrary.lookup<LuaOpenLibsFunc>("luaL_openlibs").asFunction();
  late final LuaLoadFile luaLoadFile = _dynamicLibrary.lookup<LuaLoadFileFunc>("luaL_loadfilex").asFunction();
  late final LuaPcallK luaPcallK = _dynamicLibrary.lookup<LuaPcallKFunc>("lua_pcallk").asFunction();
  late final LuaPushNumber luaPushNumber = _dynamicLibrary.lookup<LuaPushNumberFunc>("lua_pushnumber").asFunction();
  late final LuaPushString luaPushString = _dynamicLibrary.lookup<LuaPushStringFunc>("lua_pushstring").asFunction();
  late final LuaPushThread luaPushThread = _dynamicLibrary.lookup<LuaPushThreadFunc>("lua_pushthread").asFunction();
  late final LuaSetGlobal luaSetGlobal = _dynamicLibrary.lookup<LuaSetGlobalFunc>("lua_setglobal").asFunction();
  late final LuaGetGlobal luaGetGlobal = _dynamicLibrary.lookup<LuaGetGlobalFunc>("lua_getglobal").asFunction();
  late final LuaSetTop luaSetTop = _dynamicLibrary.lookup<LuaSetTopFunc>("lua_settop").asFunction();
  late final LuaLLoadString luaLLoadString = _dynamicLibrary.lookup<LuaLLoadStringFunc>("luaL_loadstring").asFunction();
  late final LuaRemove luaRemove = _dynamicLibrary.lookup<LuaRemoveFunc>("lua_remove").asFunction();
  late final LuaToBoolean luaToBoolean = _dynamicLibrary.lookup<LuaToBooleanFunc>("lua_toboolean").asFunction();
  late final LuaToInteger luaToInteger = _dynamicLibrary.lookup<LuaToIntegerFunc>("lua_tointeger").asFunction();
  late final LuaToString luaToString = _dynamicLibrary.lookup<LuaToStringFunc>("lua_tostring").asFunction();
  late final LuaToNumberX luaToNumberX = _dynamicLibrary.lookup<LuaToNumberXFunc>("lua_tonumberx").asFunction();
  late final LuaToPointer luaToPointer = _dynamicLibrary.lookup<LuaToPointerFunc>("lua_topointer").asFunction();

  LuaFFI({required String dynamicLibraryPath}) {
    _dynamicLibrary = ffi.DynamicLibrary.open(dynamicLibraryPath);
  }
}
