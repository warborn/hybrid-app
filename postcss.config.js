module.exports = {
  plugins: [
    require("postcss-import")({
      from: "app/javascript/stylesheets/application.css",
    }),
    require("postcss-flexbugs-fixes"),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009",
      },
      stage: 1,
      features: {
        customProperties: {
          warnings: false,
          preserve: true,
        },
      },
    }),
    require("tailwindcss"),
    require("autoprefixer"),
  ],
};
