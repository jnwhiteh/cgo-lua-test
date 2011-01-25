package golua

// #include <lua.h>
// #include <luaconf.h>
// #include <lualib.h>
// #include <lauxlib.h>
import "C"

type State struct {
	L *C.lua_State
}

func NewState() *State {
	return &State{C.luaL_newstate()}
}

func (s *State) NewTable() {
	C.lua_createtable(s.L, 0, 0)
}
