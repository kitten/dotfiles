const backgroundColor = '#191B1F'
const foregroundColor = '#fcfefb'
const cursorColor = 'rgba(0, 102, 255, 0.8)'
const borderColor = '#404449'
const colors = {
  black: backgroundColor,
  red: '#D3422E', // red
  green: '#4BAE16', // green
  yellow: '#F5BB12', // yellow
  blue: '#0066ff', // blue
  magenta: '#de347a', // pink
  cyan: '#8cfff8', // cyan
  white: '#BFD7DB', // light gray
  lightBlack: '#97a0a0', // medium gray
  lightRed: '#f25a55', // red
  lightGreen: '#a2e185', // green
  lightYellow: '#FFC620', // yellow
  lightBlue: '#00a0e2', // blue
  lightMagenta: '#fc6aca', // pink
  lightCyan: '#7fd6fa', // cyan
  colorCubes: '#fcfefb', // white
  grayscale: foregroundColor
}

module.exports = {
  config: {
    foregroundColor,
    backgroundColor,
    borderColor,
    cursorColor,
    colors,
    fontSize: 12,
    fontFamily: '"Operator Mono", monospace',
    css: `
      header {
        box-shadow: 0px 2px 20px rgba(0, 0, 0, 0.17);
      }

      .hyper_main {
        border-color: transparent !important;
      }
    `,
    termCSS: `
      x-row > span {
        font-weight: 500;
      }
    `,
    padding: 0
  },

  plugins: [
    'hyperterm-focus-reporting'
  ],

  // `~/.hyperterm_plugins/local/`
  localPlugins: []
};
