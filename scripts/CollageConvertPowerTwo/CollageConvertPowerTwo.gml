/// @function CollageConvertPowerTwo(number)
/// @param number
function CollageConvertPowerTwo(_num) {
	gml_pragma("forceinline");
	return power(2,round(log2(_num)));	
}
