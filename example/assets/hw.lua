--[[

    [dartvar] global var from dart ffi set

]]

LuaPrintPrefix="LuaLog: "
print(LuaPrintPrefix.."helloworldLua")
print(LuaPrintPrefix..dartvar)
function helloworldCall()
    print(LuaPrintPrefix.."you call helloworldCall function")
    return 200
end