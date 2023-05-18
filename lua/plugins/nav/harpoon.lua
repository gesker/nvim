-- mark and navigate to a quick list of marked files
return {
	{
		"ThePrimeagen/harpoon",
    --stylua: ignore
    keys = {
      { "<leader>ja", function() require("harpoon.mark").add_file() end, desc = "Harpoon Mark File" },
      { "<leader>jo", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon File Menu" },
      { "<leader>jd", function() require("harpoon.cmd-ui").toggle_quick_menu() end, desc = "Harpoon Command Menu" },
      { "<leader>j0", function() require("harpoon.ui").nav_file(0) end, desc = "Harpon File 0" },
      { "<leader>j1", function() require("harpoon.ui").nav_file(1) end, desc = "Harpon File 1" },
      { "<leader>j2", function() require("harpoon.ui").nav_file(2) end, desc = "Harpon File 2" },
      { "<leader>j3", function() require("harpoon.ui").nav_file(3) end, desc = "Harpon File 3" },
      { "<leader>j4", function() require("harpoon.ui").nav_file(4) end, desc = "Harpon File 4" },
      { "<leader>j5", function() require("harpoon.ui").nav_file(5) end, desc = "Harpon File 5" },
      { "<leader>j6", function() require("harpoon.ui").nav_file(6) end, desc = "Harpon File 6" },
      { "<leader>j7", function() require("harpoon.ui").nav_file(7) end, desc = "Harpon File 7" },
      { "<leader>j8", function() require("harpoon.ui").nav_file(8) end, desc = "Harpon File 8" },
      { "<leader>j9", function() require("harpoon.ui").nav_file(9) end, desc = "Harpon File 9" },
      { "<leader>jt1", function() require("harpoon.term").gotoTerminal(1) end, desc = "Harpoon Terminal 1" },
      { "<leader>jt2", function() require("harpoon.term").gotoTerminal(2) end, desc = "Harpoon Terminal 2" },
      { "<leader>jt3", function() require("harpoon.term").gotoTerminal(3) end, desc = "Harpoon Terminal 2" },
      { "<leader>jct1", function() require("harpoon.term").sendCommand(1,1) end, desc = "Harpoon Command to Terminal 1" },
      { "<leader>jct2", function() require("harpoon.term").sendCommand(1,2) end, desc = "Harpoon Command to Terminal 2" },
      { "<leader>jct3", function() require("harpoon.term").sendCommand(1,3) end, desc = "Harpoon Command to Terminal 3" },
    },
		opts = {
			global_settings = {
				save_on_toggle = true,
				enter_on_sendcmd = true,
			},
		},
	},
}
