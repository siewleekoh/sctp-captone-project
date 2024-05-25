const { defineConfig } = require('@vue/cli-service')
// const path = require('path');
module.exports = defineConfig({
  transpileDependencies: true
});

module.exports = {
  devServer: {
    allowedHosts: [
      'localhost',
      '.sctp-sandbox.com',
    ],
    port: 8080,
    proxy: {
        '^/api': {
            target: 'http://localhost:8888',
            ws: true,
            changeOrigin: true
        }
    }

  },
};

// module.exports = {
//   outputDir: path.resolve(__dirname, '../backend/public'),
//   devServer: {
//     proxy: {
//       '/': {
//         target: 'http://localhost:8081'
//       }
//     }
//   }
// }
