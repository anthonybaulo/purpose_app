process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;
environment.plugins.append(  
  'BundleAnalyzerPlugin',  
  new BundleAnalyzerPlugin({ analyzerMode: 'disabled' })  //disabled or static
)

module.exports = environment.toWebpackConfig()