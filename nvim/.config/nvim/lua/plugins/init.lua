local overriders = require("configs.overriders")

return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"markdown",

				"typescript",
				"javascript",
				"tsx",
				"prisma",

				"dockerfile",
				"yaml",
				"json",

				"rust",
				"go",
			},
		},
	},

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = overriders.snaks.keys,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				sections = {
					{ section = "header" },
					{
						pane = 2,
						section = "terminal",
						cmd = "colorscript -e square",
						height = 5,
						padding = 1,
					},
					{ section = "keys", gap = 1, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Git Status",
						section = "terminal",
						enabled = function()
							return Snacks.git.get_root() ~= nil
						end,
						cmd = "git status --short --branch --renames",
						height = 5,
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					},
					{ section = "startup" },
				},
			},
			indent = { enabled = true },
			git = { enabled = true },
			lazygit = { enabled = true },
			-- input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true, timeout = 3000 },
			-- scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			styles = {
				notification = {
					wo = { wrap = true },
				},
			},
		},
	},
	{ "echasnovski/mini.nvim", version = false },
	{
		"rmagatti/goto-preview",
		lazy = false,
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 15, -- Height of the floating window
				border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
				default_mappings = true,
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				references = { -- Configure the telescope UI for slowing the references cycling window.
					telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
				},
				-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
				focus_on_open = true, -- Focus the floating window when opening it.
				dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
				force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
				bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
				stack_floating_preview_windows = true, -- Whether to nest floating windows
				preview_window_title = { enable = true, position = "left" }, -- Whether
			})
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		event = "BufReadPost",
		keys = overriders.fold.keys,
		init = function()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
		opts = overriders.fold.opts,
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
				pattern = opts.filetype_exclude,
				callback = function()
					require("ufo").detach()
				end,
			})

			vim.opt.foldlevelstart = 99
			require("ufo").setup(opts)
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		keys = overriders.typescript.keys,
		config = function()
			local lspconfig = require("nvchad.configs.lspconfig")

			return require("typescript-tools").setup({
				on_attach = lspconfig.on_attach,
				on_init = lspconfig.on_init,
				capabilities = lspconfig.capabilities,
				settings = {},
			})
		end,
		ft = { "typescript", "typescriptreact", "javascriptreact", "javascript" },
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	-- {
	--   "kdheepak/lazygit.nvim",
	--   cmd = {
	--     "LazyGit",
	--     "LazyGitConfig",
	--     "LazyGitCurrentFile",
	--     "LazyGitFilter",
	--     "LazyGitFilterCurrentFile",
	--   },
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--   },
	--   keys = overriders.lazygit.keys,
	-- },
}
