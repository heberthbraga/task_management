const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  important: true,
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{rb,erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      screens: {
        sm: '640px',
        md: '768px',
        lg: '976px',
        xl: '1440px'
      },
      colors: {
        cream: '#FBF8F1',
        'gray-vintage': '#F2F2F2',
        secondary: '#38b2ac',
        'teal-origin': '#A5CFE3',
        'mint': '#DDFFE7',
        'royal-blue': '#0C1446',
        'seafonan-green': '#87ACA3'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
