module.exports = {
  devServer: {
    proxy: {
      '/api': {
            target: "http://localhost:8888/Flashback/api",
            changeOrigin: true,
            pathRewrite: { '^/api' : '' }
      },
    }
  }
}