--[[ Spotify: control and display current song. macOS only (uses AppleScript). ]]
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
