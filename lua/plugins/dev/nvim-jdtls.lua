return {
	{
		"mfussenegger/nvim-jdtls",
    -- stylua: ignore
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
		},
    -- stylua: ignore
    ft = {"java", },
    -- stylua: ignore
		keys = {
			{ "joi", "<Cmd>lua require('jdtls').organize_imports()<CR>", desc = "JDTLS Organize Imports", },
			{ "jev", "<Cmd>lua require('jdtls').extract_variable()<CR>", desc = "JDTLS Extract Variable", },
			{ "jev", "<Cmd>lua require('jdtls').extract_variable(true)<CR>", mode = "v", desc = "JDTLS Extract Variable", },
			{ "jec", "<Cmd>lua require('jdtls').extract_constant()<CR>", desc = "JDTLS Extract Constant", },
			{ "jec", "<Cmd>lua require('jdtls').extract_constant(true)<CR>", mode = "v", desc = "JDTLS Extract Constant", },
			{ "jem", "<Cmd>lua require('jdtls').extract_method(true)<CR>", mode = "v", desc = "JDTLS Extract Method", },
			{ "jtc", "<Cmd>lua require('jdtls').test_class()<CR>", mode = "v", desc = "JDTLS Test Class", },
			{ "jtm", "<Cmd>lua require('jdtls').test_nearest_method()<CR>", mode = "v", desc = "JDTLS Test Method", },
		},
    -- stylua: ignore
    config = function() 
    -- brew/apt install jdtls, temurin11, temurin17, temurin20
      local jdtls = require("jdtls")
      local home = os.getenv("HOME") -- Set in .zprofile
      local java11 = os.getenv("JAVA_11") -- Set in .zprofile
      local java17 = os.getenv("JAVA_17") -- Set in .zprofile
      local java20 = os.getenv("JAVA_20") -- Set in .zprofile
      local graalvm = os.getenv("GRAALVM") -- Set in .zprofile
      local javacmd = os.getenv("JAVA_CMD") -- Set in .zprofile
      local jdtlshome = os.getenv("JDTLS_HOME") -- Set in .zprofile
      local root_markers = { "gradlew", "mvnw", ".git" } -- presense of these files determine work folders
      local root_dir = require("jdtls.setup").find_root(root_markers)
      local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

      -- this function will be used to apply all settings!!!!
      local on_attach = function(client, bufnr) 
        -- NOTE -- Normally key maps would be set in this function. However,
        -- we are letting the package manager set these above.
        -- DO NOTHING!
      end
 
      local config = {
        flags = {
          debounce_text_changes = 80,
        },
	      on_attach = on_attach, -- We pass our on_attach keybindings to the configuration map
	      root_dir = root_dir, -- Set the root directory to our found root_marker
	      settings = {
		      java = {
			      format = {
				      settings = {
					      url = "/.local/share/eclipse/eclipse-java-google-style.xml",
					      profile = "GoogleStyle",
              },
            },
            eclipse = {
              downloadSources = true,
            },
            configuration = {
              updateBuildConfiguration = "interactive",
            },
            maven = {
              downloadSources = true,
            },
            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
            references = {
              includeDecompiledSources = true,
            },
            signatureHelp = { enabled = true },
			      contentProvider = { preferred = "fernflower" }, -- Decompile Library Use fernflower
			      completion = {
              favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
					      "org.hamcrest.Matchers.*",
					      "org.hamcrest.CoreMatchers.*",
					      "org.junit.jupiter.api.Assertions.*",
					      "java.util.Objects.requireNonNull",
					      "java.util.Objects.requireNonNullElse",
					      "org.mockito.Mockito.*",
              },
              filteredTypes = {
					      "com.sun.*",
					      "io.micrometer.shaded.*",
					      "java.awt.*",
					      "jdk.*",
					      "sun.*",
              },
            },
            -- Specify any options for organizing imports
			      sources = {
              organizeImports = {
					    starThreshold = 9999,
					    staticStarThreshold = 9999,
              },
            },
            -- How code generation should act
			      codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
              },
              hashCodeEquals = {
                useJava7Objects = true,
              },
              useBlocks = true,
            },
			      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
			      -- And search for `interface RuntimeOption`
			      -- The `name` is NOT ARBITRARY, but must match one of the elements from `enum ExecutionEnvironment` in the link above
            configuration = {
              runtimes = {
               { name = "JavaSE-11", path = java11 .. "/Contents/Home", },
               { name = "JavaSE-17", path = java17 .. "/Contents/Home", },
               { name = "JavaSE-20", path = java20 .. "/Contents/Home", },
               { name = "GraalVM", path = graalvm .. "/Contents/Home", },
              },
            },
          },
        },
	      -- cmd is the command that starts the language server. Whatever is placed
	      -- Note that eclipse.jdt.ls must be started with a Java version of 17 or higher
	      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	      -- for the full list of options
        cmd = {
          javacmd,
		      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
		      "-Dosgi.bundles.defaultStartLevel=4",
		      "-Declipse.product=org.eclipse.jdt.ls.core.product",
		      "-Dlog.protocol=true",
		      "-Dlog.level=ALL",
		      "--enable-preview",
          "-XX:+UseZGC",
		      "--add-opens",
		      "java.base/java.util=ALL-UNNAMED",
		      "--add-opens",
		      "java.base/java.lang=ALL-UNNAMED",
          -- If you use lombok, download the lombok jar and place it in ~/.local/share/eclipse
		      -- "-javaagent:" .. home  .. "/.local/share/eclipse/lombok.jar",
				  -- The jar file is located where jdtls was installed. This will need to be updated
				  -- to the location where you installed jdtls
		      "-jar",
          vim.fn.glob(jdtlshome .. "/libexec/plugins/org.eclipse.equinox.launcher_*.jar"),

		      -- The configuration for jdtls is also placed where jdtls was installed. This will
		      -- need to be updated depending on your environment
          "-configuration",
          jdtlshome .. "/libexec/config_mac",
		      -- Use the workspace_folder defined above to store data for this project
          "-data",
          workspace_folder,
        },
      }
     

      require('jdtls').start_or_attach(config)
    end,
	},
}
