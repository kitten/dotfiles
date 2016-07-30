module.exports = {
  config: {
    fontSize: 12,
    fontFamily: '"Fira Code", Monoid, Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    cursorColor: 'rgba(189, 195, 199, .8)',
    css: `
      header {
        box-shadow: 0px 2px 20px rgba(0, 0, 0, 0.17);
      }
    `,
    termCSS: `
      x-screen {
        line-height: 1;
      }

      x-row {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: flex-start;
        flex-wrap: no-wrap;
        height: 14px;
      }

      x-row > span {
        display: block;
        height: 14px;
        line-height: 16px;
        vertical-align: middle;
      }
    `,
    padding: '0'
  },

  plugins: [
    'hypertheme',
    'hyperterm-draculicious',
    'hyperterm-final-say'
  ],

  // `~/.hyperterm_plugins/local/`
  localPlugins: []
};
