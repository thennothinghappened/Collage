texPage = new Collage();
texPage.StartBatch();
var _bat = sprite_add("bats.png", 1, false, false, 0, 0);
texPage.AddSpriteSheetSingle(_bat, 16, "bats", 0, 0, 32, 32).SetScale(0.5, 0.5, true).SetScale(2, 2, true);
sprite_delete(_bat);
texPage.FinishBatch();
image = texPage.GetImageInfo("bats");
