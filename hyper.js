module.exports = {
  config: {
    fontSize: 13,
    fontFamily: '"Operator Mono"',
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
        font-weight: 500;
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
