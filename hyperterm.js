module.exports = {
  config: {
    fontSize: 12,
    fontFamily: '"Fira Code", Monoid, Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    css: `
      header {
        box-shadow: 0px 2px 20px rgba(0, 0, 0, 0.17);
      }

      .hyperterm_main {
        border-color: transparent !important;
      }
    `,
    padding: '0'
  },

  plugins: [
    'hyperterm-adventurous',
    'hyperterm-title',
    'hyperterm-alternatescroll',
    'hyperterm-focus-reporting',
    'hyperterm-cursor',
    'hyperterm-final-say'
  ],

  // `~/.hyperterm_plugins/local/`
  localPlugins: []
};
