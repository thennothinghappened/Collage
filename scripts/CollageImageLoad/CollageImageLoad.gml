/// @func CollageImageLoad(identifier, subImage)
/// @param identifier
/// @param subImage
function CollageImageLoad(_identifier, _subImage) {
	gml_pragma("forceinline");
	var _image;
	
	if (is_string(_identifier)) {
		if (!COLLAGE_IMAGES_ARE_PUBLIC) {
			__CollageThrow("COLLAGE_IMAGES_ARE_PUBLIC is set to false and therefore string names do not work.");
		}
		
		 _image =  global.__CollageImageMap[$ _identifier];
	} else {
		_image = _identifier;	
	}
	
	_image.subImagesArray[_subImage % _image.subImagesCount].texturePageStruct.__restoreFromCache();
}
