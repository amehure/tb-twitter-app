const { environment } = require('@rails/webpacker')
const WebpackDevServer = require('webpack-dev-server')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend("provide",
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        popper: ['popper.js', 'default']
    })
)