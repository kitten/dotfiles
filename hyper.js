module.exports = {
  config: {
    fontSize: 12,
    fontFamily: '"Fira Code", Monoid, Menlo, "DejaVu Sans Mono", "Lucida Console", monospace, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"',
    css: `
      header {
        box-shadow: 0px 2px 20px rgba(0, 0, 0, 0.17);
      }

      .hyperterm_main {
        border-color: transparent !important;
      }
    `,
    termCSS: `
      x-row > span {
      }
    `,
    padding: '0'
  },

  plugins: [
    'hyperterm-adventurous',
    'hyperterm-title',
    'hyperterm-focus-reporting'
  ],

  // `~/.hyperterm_plugins/local/`
  localPlugins: []
};
