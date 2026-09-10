-- waterways/init.lua

local function register_blinking_light(name, desc, color_on, color_off)
	local base = "waterways:" .. name
	local off = base .. "_off"

	-- ON state (appears in creative/crafting)
	minetest.register_node(base, {
		description = desc,
		tiles = {"default_mese_block.png^[colorize:" .. color_on .. ":255"},
		paramtype = "light",
		light_source = 14, -- Max intensity
		drawtype = "normal",
		groups = {cracky = 3, oddly_breakable_by_hand = 1},
		drop = base,
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(0.5)
		end,
		on_timer = function(pos)
			minetest.swap_node(pos, {name = off})
			minetest.get_node_timer(pos):start(0.5)
			return false
		end,
	})

	-- OFF state (hidden from inventory)
	minetest.register_node(off, {
		description = desc .. " (Off)",
		tiles = {"default_mese_block.png^[colorize:" .. color_off .. ":255"},
		paramtype = "light",
		light_source = 0,
		drawtype = "normal",
		groups = {cracky = 3, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1},
		drop = base,
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(0.5)
		end,
		on_timer = function(pos)
			minetest.swap_node(pos, {name = base})
			minetest.get_node_timer(pos):start(0.5)
			return false
		end,
	})
end

-- Register exactly 2 lights
register_blinking_light("red", "Red Mese Light", "#ff0000", "#440000")
register_blinking_light("green", "Green Mese Light", "#00ff00", "#004400")

-- Cleanup command
minetest.register_chatcommand("removewaterways", {
	description = "Remove all waterways blocks in 100 node radius",
	privs = {interact = true},
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then return false, "Player not found." end
		
		local pos = player:get_pos()
		local r = 100
		local minp = {x=pos.x-r, y=pos.y-r, z=pos.z-r}
		local maxp = {x=pos.x+r, y=pos.y+r, z=pos.z+r}
		
		local found = minetest.find_nodes_in_area(minp, maxp, {
			"waterways:red", "waterways:red_off",
			"waterways:green", "waterways:green_off"
		})
		
		for _, p in ipairs(found) do
			minetest.set_node(p, {name = "air"})
		end
		
		return true, "Removed " .. #found .. " blocks."
	end,
})