if (global.timeattack == 1)
	instance_destroy();
if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
if (content == obj_pizzakinshroom && global.shroomfollow)
	instance_destroy();
if (content == obj_pizzakincheese && global.cheesefollow)
	instance_destroy();
if (content == obj_pizzakintomato && global.tomatofollow)
	instance_destroy();
if (content == obj_pizzakinsausage && global.sausagefollow)
	instance_destroy();
if (content == obj_pizzakinpineapple && global.pineapplefollow)
	instance_destroy();
	
if (content == obj_pizzakinmush && global.mushfollow)
	instance_destroy();
if (content == obj_pizzakinonion && global.onionfollow)
	instance_destroy();
if (content == obj_pizzakinolive&& global.olivefollow)
	instance_destroy();
if (content == obj_pizzakinbrocolli&& global.brocollifollow)
	instance_destroy();
	
if (global.snickchallenge == 1)
	instance_destroy();
