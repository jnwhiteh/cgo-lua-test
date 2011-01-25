#include <lua.h>
#include <luaconf.h>
#include <lualib.h>
#include <lauxlib.h>

int main(int argc, char **argv) {
    lua_State *L = luaL_newstate();
    lua_createtable(L, 0, 0);
    return 0;
}

