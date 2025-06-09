function CollageStaticCacheClear(){
	static _cache = __CollageSystem().__CollageStaticCache;
	
	var _i = 0;
	repeat(array_length(_cache)) {
		file_delete(_cache[_i++]);
	}
	
	array_resize(_cache, 0);
}