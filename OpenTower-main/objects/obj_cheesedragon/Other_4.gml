if (ds_list_find_index(global.baddieroom, id) != -1)
	instance_destroy();

with (obj_bosscontroller)
	bossID = other.id;
