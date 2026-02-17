--[[ Spotify: control and display current song. macOS only (uses AppleScript).
  The plugin looks for scripts under config/lua/plugins/spotify.nvim/...; with lazy.nvim
  they live in data/lazy/spotify.nvim. A symlink at lua/plugins/spotify.nvim/lua/spotify/scripts
  -> ~/.local/share/nvim/lazy/spotify.nvim/lua/spotify/scripts fixes this. Recreate after fresh clone:
  mkdir -p lua/plugins/spotify.nvim/lua/spotify && ln -sfn ~/.local/share/nvim/lazy/spotify.nvim/lua/spotify/scripts lua/plugins/spotify.nvim/lua/spotify/scripts
]]
return {
  {
    'spinalshock/spotify.nvim',
    cmd = { 'SpotifyPlayPause', 'SpotifyNext', 'SpotifyPrev', 'SpotifyInfo', 'SpotifyVolUp', 'SpotifyVolDown', 'SpotifyToggleShuffle', 'SpotifyToggleRepeat', 'SpotifyToggleMute', 'SpotifyVolume' },
    keys = {
      { '<leader>mp', '<cmd>SpotifyPlayPause<cr>', desc = '[M]usic [P]lay/Pause' },
      { '<leader>mn', '<cmd>SpotifyNext<cr>', desc = '[M]usic [N]ext' },
      { '<leader>mb', '<cmd>SpotifyPrev<cr>', desc = '[M]usic [B]ack (previous)' },
      { '<leader>mi', '<cmd>SpotifyInfo<cr>', desc = '[M]usic [I]nfo (current song)' },
      { '<leader>m+', '<cmd>SpotifyVolUp<cr>', desc = '[M]usic volume up' },
      { '<leader>m-', '<cmd>SpotifyVolDown<cr>', desc = '[M]usic volume down' },
      { '<leader>ms', '<cmd>SpotifyToggleShuffle<cr>', desc = '[M]usic [S]huffle' },
      { '<leader>mr', '<cmd>SpotifyToggleRepeat<cr>', desc = '[M]usic [R]epeat' },
      { '<leader>mm', '<cmd>SpotifyToggleMute<cr>', desc = '[M]usic [M]ute' },
    },
    opts = {
      -- Default keymaps (pp, pn, pb, etc.) are still available; leader ones above for discoverability
      keymaps = {},
    },
    config = function(_, opts)
      require('spotify').setup(opts)
    end,
  },
}
