local db = require("dashboard")

-- db.custom_header = {
--   "   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣶⣶⣶⣶⠶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀ ",
--   " ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⠁⠀⢀⠈⢿⢀⣀⠀⠹⣿⣿⣿⣦⣄⠀⠀⠀ ",
--   " ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⠿⠀⠀⣟⡇⢘⣾⣽⠀⠀⡏⠉⠙⢛⣿⣷⡖⠀ ",
--   " ⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠷⠶⠤⠙⠒⠀⠒⢻⣿⣿⡷⠋⠀⠴⠞⠋⠁⢙⣿⣄ ",
--   " ⠀⠀⠀⠀⢸⣿⣿⣯⣤⣤⣤⣤⣤⡄⠀⠀⠀⠀⠉⢹⡄⠀⠀⠀⠛⠛⠋⠉⠹⡇ ",
--   " ⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣼⣇⣀⣀⣀⣛⣛⣒⣲⢾⡷ ",
--   " ⢀⠤⠒⠒⢼⣿⣿⠶⠞⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⣼⠃ ",
--   " ⢮⠀⠀⠀⠀⣿⣿⣆⠀⠀⠻⣿⡿⠛⠉⠉⠁⠀⠉⠉⠛⠿⣿⣿⠟⠁⠀⣼⠃⠀ ",
--   " ⠈⠓⠶⣶⣾⣿⣿⣿⣧⡀⠀⠈⠒⢤⣀⣀⡀⠀⠀⣀⣀⡠⠚⠁⠀⢀⡼⠃⠀⠀ ",
--   " ⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣭⣭⣭⣭⣭⣥⣤⣤⣤⣴⣟⠁    ",
-- }

db.custom_header = {
  "",
  "⠀⢀⠔⠉⠄⠀⠀⠀⠀⢈⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⡔⢧⢀⠂⠈⢂⠀⠀⠀⢠⠓⣬⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⢇⠎⣧⡂⠁⡀⠡⠀⠀⢠⣛⡴⢻⠀⠀⠀⢰⣠⠴⠲⢦⡄⠀⣠⠴⠒⠦⡄⠀⣠⡴⠖⠶⣄⠰⣶⣦⠀⠀⣴⣶⢳⣶⡆⣶⣶⣶⢾⣶⣤⣶⢷⣶⣄",
  "⣎⠞⡴⡛⡄⠐⠠⠐⠀⢸⡜⣾⣹⠀⠀⠀⢸⡇⠀⠀⠀⣷⢸⣧⣤⣤⣤⣼⣶⡟⠀⠀⠀⠘⣷⢹⣿⡄⢰⣿⠏⢸⣿⡇⣿⣿⠁⠀⣿⣿⠁⠀⣿⣿",
  "⡝⣖⢧⡃⠑⡀⢂⠐⡐⣼⣳⢯⣿⠀⠀⠀⢸⡇⠀⠀⠀⣿⢸⡏⠉⠉⠉⠉⢹⡇⠀⠀⠀⢀⣿⠈⢿⣷⣾⡿⠀⢸⣿⡇⣿⣿⠀⠀⣿⣿⠀⠀⣿⣿",
  "⣟⣮⢗⡇⠀⠈⢆⠱⢠⢸⢯⣟⣾⠀⠀⠀⢸⡇⠀⠀⠀⣿⠀⠻⢦⣀⡤⠶⠀⠙⢦⣀⡤⠾⠃⠀⠘⡿⡿⠁⠀⢸⢿⡇⠿⣿⠀⠀⡿⡿⠀⠀⡿⣿",
  "⠻⣾⣻⡆⠀⠀⠀⠱⡂⢞⣧⣻⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠈⠳⡇⠀⠀⠀⠀⠘⢺⠗⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "",
}

-- db.custom_header = {}
db.custom_center = { { desc = vim.fn.getcwd(), action = "DashboardNewFile" } }
