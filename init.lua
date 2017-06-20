local computers = {
	commodore_pet = {
		name = "Commodore PET",
		screen_offset = {
			x = 106,
			y = 668
		},
		node_box = {
			{-0.3,	-0.2,	0,		0.3,	0.2,	0.3},
			{-0.4,	-0.3,	-0.2,	0.4,	-0.2,	0.5},
			{-0.4,	-0.5,	-0.5,	0.4,	-0.3,	0.5}
		},
	},
	ibm_5120 = {
		name = "IBM 5120",
		screen_offset = {
			x = 320,
			y = 401
		},
		node_box = {
			{-0.3,	-0.5,	-0.15,	0.4,	0,		0.3},
			{-0.3,	-0.5,	-0.4,	0.2,	-0.35,	-0.15}
		},
	},
	ibm_5100 = {
		name = "IBM 5100",
		screen_offset = {
			x = 21,
			y = 803
		},
		node_box = {
			{-0.3,	-0.4,	-0.25,	0.3,	-0.2,	0.45},
			{-0.3,	-0.5,	-0.5,	0.3,	-0.4,	0.45}
		},
	},
	ibm_ps2 = {
		name = "IBM PS2",
		screen_offset = {
			x = 707,
			y = 236
		},
		node_box = {
			{-0.2,	-0.3,	0,	0.2,	0.1,	0.2},
			{-0.25,	-0.3,	-0.3,	0.25,	0.15,	0},
			{-0.35,	-0.5,	-0.35,	0.35,	-0.3,	0.35}
		},
	},
	apple_mac_classic = {
		name = "Apple Mac Classic",
		screen_offset = {
			x = 666,
			y = 638
		},
		node_box = {
			-- x z y
			{-0.25,	-0.5,	-0.05,	0.25,	0.25,	0.45},
			{0.4,	-0.5,	-0.1,	0.5,	-0.4,	0.1},
			{-0.5,	-0.5,	-0.5,	0.4,	-0.4,	-0.2}
		},
	},
	osborne_1 = {
		name = "Osborne 1",
		screen_offset = {
			x = 415,
			y = 92
		},
		node_box = {
			{-0.4,	-0.5,	-0.1,	0.4,	-0.2,	0.45},
			{-0.4,	-0.5,	-0.45,	0.4,	-0.4,	-0.1}
		},
	},
	grid_compass_1101 = {
		name = "Grid Compass 1101",
		screen_offset = {
			x = 0,
			y = 716
		},
		node_box = {
			{-0.3,	-0.4,	-0.1,	0.3,	0,		0.2},
			{-0.3,	-0.5,	-0.45,	0.3,	-0.4,	0.5}
		},
	},
	amstrad_pcw8512 = {
		name = "Amstrad PCW8512",
		screen_offset = {
			x = 365,
			y = 784
		},
		node_box = {
			{-0.35,	-0.5,	-0.1,	0.3,	0.15,	0.45},
			{-0.35,	-0.5,	-0.45,	0.4,	-0.45,	-0.15}
		},
	},
}
for id, def in pairs(computers) do
	minetest.register_node("retro_computers:" .. id .. "_off", {
		description = def.name,
		walkable = true,
		on_rightclick = function(pos, node, _, _, _)
			node.name = "retro_computers:" .. id .. "_on"
			minetest.set_node(pos, node)
		end,
		tiles = {{name = "retro_computers_" .. id .. ".png", backface_culling = true}},
		groups = {
			snappy = 1,
			computer = 1,
			oddly_breakable_by_hand = 3,
			falling_node = 1
		},
		selection_box = {
			type = "fixed",
			fixed = def.node_box,
		},
		node_box = {
			type = "fixed",
			fixed = def.node_box,
		},
		drawtype = "mesh",
		mesh = "retro_computers_" .. id .. ".obj",
		paramtype2 = "facedir",
		paramtype = "light",
		sunlight_propagates = true,
	})
	minetest.register_node("retro_computers:" .. id .. "_on", {
		description = def.name,
		walkable = true,
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			node.name = "retro_computers:" .. id .. "_off"
			minetest.set_node(pos, node)
			--minetest.place_node(pos, node)
		end,
		tiles = {{
			name = "[combine:1024x1024:0,0=retro_computers_" .. id .. ".png:" .. def.screen_offset.x .. "," .. def.screen_offset.y .. "=retro_computers_" .. id .. "_screen.png",
			backface_culling = true
		}},
		groups = {
			not_in_creative_inventory = 1,
			snappy = 1,
			computer = 1,
			oddly_breakable_by_hand = 3,
			falling_node = 1
		},
		selection_box = {
			type = "fixed",
			fixed = def.node_box,
		},
		node_box = {
			type = "fixed",
			fixed = def.node_box,
		},
		drawtype = "mesh",
		mesh = "retro_computers_" .. id .. ".obj",
		paramtype2 = "facedir",
		paramtype = "light",
		sunlight_propagates = true,
	})
end