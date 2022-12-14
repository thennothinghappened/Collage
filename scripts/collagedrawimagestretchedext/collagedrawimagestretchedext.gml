/// @func CollageDrawImageStretchedExt(image, image_index, x, y, width, height, color, alpha);
/// @param {Struct.__CollageImageClass} collage_image
/// @param {Real} image_index
/// @param {Real} x
/// @param {Real} y
/// @param {Real} width
/// @param {Real} height
/// @param {Real} color
/// @param {Real} alpha
/* Feather ignore all */
function CollageDrawImageStretchedExt(_imageData, _imageIndex, _x, _y, _width, _height, _color, _alpha) {
	gml_pragma("forceinline");
	if (!is_struct(_imageData)) __CollageThrow("Invalid collage_image! Got " + string(_imageData) + " instead!");
	var _ratio = _imageData.__ratio;
	var _uvs = _imageData.__InternalGetUvs(_imageIndex);
	
	_uvs.texturePageStruct.CheckSurface();	
	var _xPos = (__COLLAGE_DRAW_IMAGE_STRETCHED_RESPECT_ORIGIN) ? _x-_uvs.xPos : _x;
	var _yPos = (__COLLAGE_DRAW_IMAGE_STRETCHED_RESPECT_ORIGIN) ? _y-_uvs.xPos : _y;
	draw_surface_part_ext(_uvs.texturePageStruct.__surface, 
		_uvs.left, 
		_uvs.top, 
		_uvs.right, 
		_uvs.bottom, 
		_xPos, 
		_yPos, 
		(_width/_imageData.__width)/_ratio, 
		(_height/_imageData.__height)/_ratio, 
		_color, 
		_alpha
	);	
}
