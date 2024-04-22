/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{html,ts}'],
  theme: {
    extend: {
      screens: {
        xs: '425px'
      },
      colors: {
        primary: {
          100: '#FFF'
        }
      }
    }
  },
  plugins: []
}
