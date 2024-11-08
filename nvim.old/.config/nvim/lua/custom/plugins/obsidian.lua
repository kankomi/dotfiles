return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
    },
    templates = {
      folder = "_templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    notes_subdir = "inbox",
    attachments = {
      img_folder = "_files",
    },

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / tostring(spec.title)
      return path:with_suffix(".md")
    end,
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      -- vim.fn.jobstart({ "open", url }) -- Mac OS
      vim.fn.jobstart({ "wsl-open", url }) -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
      vim.ui.open(url)                     -- need Neovim 0.10.0+
    end,
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
    -- file it will be ignored but you can customize this behavior here.
    ---@param img string
    follow_img_func = function(img)
      -- vim.fn.jobstart { "qlmanage", "-p", img } -- Mac OS quick look preview
      vim.fn.jobstart({ "xdg-open", img }) -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
    end,

  },
  keys = {
    { "<leader>on",  "<cmd>ObsidianNew<cr>",             desc = "New Obsidian Note" },
    { "<leader>oot", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New Obsidian Note" },
    { "<leader>so",  "<cmd>ObsidianQuickSwitch<cr>",     desc = "Note Quickswitch" },
    { "<leader>ob",  "<cmd>ObsidianBacklinks<cr>",       desc = "Obsidian Backlinks" },
    { "<leader>ot",  "<cmd>ObsidianToday<cr>",           desc = "Obsidian Today" },
    { "<leader>ost", "<cmd>ObsidianTags<cr>",            desc = "Obsidian Tags" },
    { "<leader>oy",  "<cmd>ObsidianYesterday<cr>",       desc = "Obsidian Yesterday" },
    { "<leader>or",  "<cmd>ObsidianRename<cr>",          desc = "Obsidian Rename" },
    {
      "<C-b>",
      function()
        require('obsidian').util.toggle_checkbox()
      end,
      desc = "Toogle Checkbox",
    },
  },
}
