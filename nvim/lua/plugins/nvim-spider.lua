return {
  "chrisgrieser/nvim-spider",
  config = function()
    for _, key in ipairs({ "b", "w", "e" }) do
      vim.keymap.set({ "n", "o", "x" }, key, "<cmd>lua require('spider').motion('" .. key .. "')<CR>", {})
    end

    require("spider").setup({
      subwordMovement = false,
    })

    -- So cw stays the same as before
    vim.keymap.set("n", "cw", "ce", { remap = true })
  end,
}

