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
    `,
    padding: '0',

    overlay: {
      animate: false,
      alwaysOnTop: true,
      hasShadow: false,
      hideOnBlur: true,
      hideDock: false,
      hotkeys: ['Option+Space'],
      resizable: true,
      position: 'top',
      primaryDisplay: false,
      startup: true,
      size: 1,
      tray: false,
      unique: true
    }
  },

  plugins: [
    'hypertheme',
    'hyperterm-draculicious',
    'hyperterm-overlay',
    'hyperterm-final-say'
  ],

  // `~/.hyperterm_plugins/local/`
  localPlugins: []
};
