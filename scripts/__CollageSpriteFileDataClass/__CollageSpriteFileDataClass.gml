/// @ignore
/// feather ignore all
function __CollageSpriteFileDataClass(_identifier, _spriteID, _subImage = 1, _isCopy = undefined) constructor {
	static __system = __CollageSystem();
	__name = _identifier;
	__subImages = _subImage;
	__xOrigin = 0;
	__yOrigin = 0;
	if (!sprite_exists(_spriteID)) {
		__CollageThrow("Invalid spriteID: " + string(__spriteID));	
	}
	__spriteID = _spriteID;
	__is3D = 0;
	__isCopy = _isCopy ?? (_spriteID > __system.__CollageGMSpriteCount);
	__keepTogether = false;
	__premultiplyAlpha = false;
	__tiling = 0;
	__colour = c_white;
	__alpha = 1;
	__priority = -1;
	__speed = 1;
	__speedType = 0;
	
	static AddSurfaceAsFrame = function(_surf, _x, _y, _width, _height, _removeBack = false, _smooth = false) {
			if (!__isCopy) {
				if (__spriteID > __system.__CollageGMSpriteCount) {
					__isCopy = true;
					__spriteID = sprite_duplicate(__spriteID);
				}
			}
			sprite_add_from_surface(__spriteID, _surf, _x, _y, _width, _height, _removeBack, _smooth);
			return self;
	}
	
	static AddSpriteAsFrame = function(_sprite, _removeBack = false, _smooth = false) {
		if (!__isCopy) {
			if (__spriteID > __system.__CollageGMSpriteCount) {
				__isCopy = true;
				__spriteID = sprite_duplicate(__spriteID);
			}
		}
		var _width = sprite_get_width(_sprite);
		var _height = sprite_get_height(_sprite);
		var _surf = surface_create();
		CollageSterlizeGPUState();
		var _i = 0;
		repeat(sprite_get_number(_sprite)) {
			surface_set_target(_sprite);
			draw_clear_alpha(c_black, 0);
			draw_sprite(_sprite, _i, 0, 0);
			surface_reset_target();
			AddSurfaceAsFrame(__spriteID, _surf, 0, 0, _width, _height, _removeBack, _smooth);
			++_i;
		}
		CollageRestoreGPUState();
		
		surface_free(_surf);
		return self;
	}
	
	static SetClump = function(_bool) {
		__keepTogether = _bool;
		return self;
	}
	
	static SetOrigin = function(_xOrigin, _yOrigin) {
		var _origin = __CollageOriginValidator(__spriteID, _xOrigin, _yOrigin);
		__xOrigin = _origin[0];
		__yOrigin = _origin[1];
		sprite_set_offset(__spriteID, __xOrigin, __yOrigin);
		return self;
	}
	
	/// @deprecated
	static Set3D = function(_bool) {
		__is3D = _bool;
		return self;
	}
	
	static SetSeparateTexture = function(_bool) {
		__is3D = _bool;
		return self;
	}
	
	static SetPremultiplyAlpha = function(_bool) {
		__premultiplyAlpha = _bool;
		return self;
	}
	
	static SetTiling = function(_horizontal, _vertical) {
		__tiling = (_horizontal << 8) | _vertical;
		return self;
	}
	
	static SetBlend = function(_col, _alpha) {
		__colour = _col;
		__alpha = _alpha;
		return self;
	}
	
	static SetPriority = function(_num) {
		__priority = _num;
		return self;
	}
	
	static SetSpeed = function(_value) {
		__speed = _value;
		return self;
	}
	
	static SetSpeedType = function(_value) {
		__speedType = _value;
		return self;
	}
}
