// assets/tailwind.config.js
const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/meu_app_web.ex",
    "../lib/meu_app_web/**/*.*ex"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"), // O que você precisa para o texto rico
  ]
}