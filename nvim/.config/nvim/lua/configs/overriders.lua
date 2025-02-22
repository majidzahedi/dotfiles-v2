local M = {}

M.fold = {
  opts = {
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  },
  keys = {
    {
      "zr",
      function()
        require("ufo").openFoldsExceptKinds { "comment" }
      end,
      desc = "󰘖 󱃄 Open All Folds except comments",
    },
    {
      "zm",
      function()
        require("ufo").closeAllFolds()
      end,
      desc = "󰘖 󱃄 Close All Folds",
    },
    {
      "z1",
      function()
        require("ufo").closeFoldsWith(1)
      end,
      desc = "󰘖 󱃄 Close Level 1 Folds",
    },
    {
      "z2",
      function()
        require("ufo").closeFoldsWith(2)
      end,
      desc = "󰘖 󱃄 Close Level 2 Folds",
    },
    {
      "z3",
      function()
        require("ufo").closeFoldsWith(3)
      end,
      desc = "󰘖 󱃄 Close Level 3 Folds",
    },
    {
      "z4",
      function()
        require("ufo").closeFoldsWith(4)
      end,
      desc = "󰘖 󱃄 Close Level 4 Folds",
    },
  },
}

M.snaks = {
  keys = {
    { "<leader>lgb", "<Cmd> lua Snacks.git.blame_line() <CR>", desc = "Blame line" },
    { "<leader>lgg", "<Cmd> lua Snacks.lazygit() <CR>", desc = "Lazygit" },
    { "<leader>lgl", "<Cmd> lua Snacks.lazygit.log_file() <CR>", desc = "Lazygit current file" },
    -- git
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },
  },
}

M.lazygit = {
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}

M.typescript = {
  keys = {
    { "<leader>lo", "<Cmd> TSToolsOrganizeImports <CR>", desc = "Orgnize Imports" },
    { "<leader>lO", "<Cmd> TSToolsSortImports <CR>", desc = "Sort Imports" },
    { "<leader>lu", "<Cmd> TSToolsRemoveUnused <CR>", desc = "Remove Imports" },
    { "<leader>lz", "<Cmd> TSToolsGoToSourceDefinition <CR>", desc = "Go To Source Definition" },
    { "<leader>lR", "<Cmd> TSToolsRemoveUnusedImports <CR>", desc = "Remove Unused" },
    { "<leader>lF", "<Cmd> TSToolsFixAll <CR>", desc = "Fix All" },
    { "<leader>lA", "<Cmd> TSToolsAddMissingImports <CR>", desc = "Add Missing Imports" },
    { "<leader>lr", "<Cmd> TSToolsRenameFile <CR>", desc = "Renaming File" },
  },
}

return M
