fx_version 'cerulean'

games {"gta5", "rdr3"}

author "Local9"
version '1.0.0'

lua54 'yes'

ui_page 'web/build/index.html'

client_script "client/**/*"
server_script "server/**/*"

files {
  'web/build/index.html',
  'web/build/**/*'
}

-- Resource metadata entry to set the scoreboard header
scoreboard_header "Scoreboard for FiveM in Svelte"