function CollageStaticSurfaceSetSave(_value) {
	static _global = __CollageSystem();
	_global.__CollageSurfaceSaveCallback = _value ?? surface_save;
}