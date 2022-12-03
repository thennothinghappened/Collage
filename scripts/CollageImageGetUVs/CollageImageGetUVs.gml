/// @func CollageGetImageUVs(collage_image_or_name, image_index)
/// @param {Struct.__CollageImageClass, String} collage_image_or_name
/// @param {Real} image_index
/// @return {Struct.__CollageUVsClass}
/* Feather ignore all */
function CollageGetImageUVs(_identifier, _imageIndex) {
	gml_pragma("forceinline");
	if (is_string(_identifier)) {
		if (!__COLLAGE_IMAGES_ARE_PUBLIC) {
			__CollageThrow("__COLLAGE_IMAGES_ARE_PUBLIC is set to false and therefore string names do not work.");
		}
		
		if (!CollageImageExists(_identifier)) __CollageThrow(_identifier + " doesn't exist!");
		return global.__CollageImageMap[$ _identifier].GetUVs(_imageIndex);
	}
	
	if (!CollageImageExists(_identifier)) __CollageThrow(_identifier + " doesn't exist!");
	return _identifier.GetUVs(_imageIndex);
}