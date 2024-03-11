if (room == rank_room)
    visible = false
else
    visible = false
playerid = obj_player1.id
image_speed = 0
var _p1spr = obj_player1.sprite_index
var _spr = obj_player2.spr_idle
ds_queue_enqueue(spritequeue, [_spr, obj_player1.image_index])
