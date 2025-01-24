local colors = {
  rose1 = "#191724",
  rose2 = "#1f1d2e",
  rose3 = "#26233a",
  rose4 = "#6e6a86",
  rose5 = "#e0def4",
  rose6 = "#9ccfd8",
  rose7 = "#c4a7e7",
}

return {
  normal = {
    a = { fg = colors.rose1, bg = colors.rose4, gui = "bold" },
    b = { fg = colors.rose5, bg = colors.rose1 },
    c = { fg = colors.rose5, bg = colors.rose3 },
  },
  insert = { a = { fg = colors.rose1, bg = colors.rose6, gui = "bold" } },
  visual = { a = { fg = colors.rose1, bg = colors.rose7, gui = "bold" } },
  replace = { a = { fg = colors.rose1, bg = colors.rose3, gui = "bold" } },
  inactive = {
    a = { fg = colors.rose1, bg = colors.rose4, gui = "bold" },
    b = { fg = colors.rose5, bg = colors.rose1 },
    c = { fg = colors.rose5, bg = colors.rose1 },
  },
}
