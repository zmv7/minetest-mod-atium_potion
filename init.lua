minetest.register_craftitem("atium_potion:potion",{
description = "Invincibility atium potion",
inventory_image = "atium_potion.png",
on_use = function(itemstack, player, pointed_thing)
    if player then
        local oldgroups = player:get_armor_groups()
        if oldgroups.immortal then
            minetest.chat_send_player(player:get_player_name(),"-!- You already invincible!")
        return end
        player:set_armor_groups({immortal=1})
        itemstack:take_item()
        minetest.chat_send_player(player:get_player_name(),"-!- Invincibility activated for 1 minute!")
        minetest.after(60,function()
            player:set_armor_groups(oldgroups)
            minetest.chat_send_player(player:get_player_name(),"-!- Invincibility timed out!")
        end)
    end
    return itemstack
end})
minetest.register_craft({
	output = "atium_potion:potion",
	recipe = {
		{"atium:atium_cluster","atium:atium_cluster","atium:atium_cluster"},
		{"atium:atium_cluster","vessels:glass_bottle","atium:atium_cluster"},
		{"atium:atium_cluster","atium:atium_cluster","atium:atium_cluster"}
	}
})
