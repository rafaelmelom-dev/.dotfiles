return {
  { "GCBallesteros/jupytext.nvim", config = true, lazy = false },

  {
    "benlubas/molten-nvim",
    version = "^1.9.2",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      local selectAndRunJupyterCodeBlock = function()
        local startLine = nil
        local endLine = nil
        local actualLine = vim.fn.line(".")

        for i = actualLine, 1, -1 do
          local line = vim.fn.getline(i)
          if line:match("^%s*# %%%%") then
            startLine = i
            break
          end
        end

        local lastLine = vim.fn.line("$")
        for i = actualLine + 1, lastLine do
          local line = vim.fn.getline(i)
          if line:match("^%s*# %%%%") then
            endLine = i
            break
          end
        end

        if not endLine then
          endLine = lastLine + 1
        end

        if startLine and endLine then
          vim.fn.MoltenEvaluateRange(startLine + 1, endLine - 1)
        else
          print("Could not find the text block")
        end
      end

      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
      vim.keymap.set(
        "n",
        "<localleader>e",
        ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" }
      )
      vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
      vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
      vim.keymap.set(
        "v",
        "<localleader>r",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "evaluate visual selection" }
      )
      vim.keymap.set("n", "<localleader>rc", selectAndRunJupyterCodeBlock, { silent = true, desc = "evaluate cell" })
    end,
  },
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
}
