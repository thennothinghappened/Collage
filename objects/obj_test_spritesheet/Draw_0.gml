var _info = imageArray[current_time / 4000 mod array_length(imageArray)];

CollageDrawImageExt(_info, current_time / 400, 256, 128, 4, 4, 0, c_white, 1);

CollageDrawImageExt(texPage.GetImageInfo("spr_bat2_fly_down"), current_time / 400, 256, 256, 4, 4, 0, c_white, 1);
CollageDrawImageExt(texPage.GetImageInfo("spr_bat2_fly_up"), current_time / 400, 256, 384, 4, 4, 0, c_white, 1);