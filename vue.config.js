const path = require('path');

module.exports = {
  css: {
    loaderOptions: {
      scss: {
        additionalData: `@import "@/assets/scss/variables.scss";`,
      },
    },
  },
  configureWebpack: {
    resolve: {
      alias: {
        '@': path.join(__dirname, 'src/'),
      },
    },
  },
  transpileDependencies: ['vuetify'],
};
