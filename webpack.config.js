// webpack.config.
const path = require('path');
const { HotModuleReplacementPlugin } = require('webpack');
const PnpWebpackPlugin = require(`pnp-webpack-plugin`);
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const HtmlTemplatePlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const DotEnvPlugin = require('dotenv-webpack');

const NODE_ENV = process.env.NODE_ENV  || 'development';
const isDev = /^development$/i.test(NODE_ENV);

const APP_DIR = path.resolve(__dirname);
const DIST_DIR =path.resolve(__dirname, 'dist');
const ASSETS_DIR =path.resolve(__dirname, 'assets');
const ENTRY_PATH = path.resolve(APP_DIR, 'src/client/index.ts');
const INDEX_PATH = path.resolve(APP_DIR, 'src/client/index.html');

module.exports = {
    mode: process.env.NODE_ENV || 'development',
    entry: ENTRY_PATH,
    resolve: {
        alias: {
            'vue$': 'vue/dist/vue.esm.js'
        },
        plugins: [PnpWebpackPlugin],
        extensions: [ '*', '.js','.ts', '.vue', '.json'  ],
    },
    resolveLoader: {
        plugins: [PnpWebpackPlugin.moduleLoader(module)]
    },
    plugins: [
        new DotEnvPlugin({
            systemvars: true
        }),
        new HtmlTemplatePlugin({
            template: INDEX_PATH
        }),
        new VueLoaderPlugin(),
        new MiniCssExtractPlugin({
            filename: "[name].[hash].css"
        }),
        new HotModuleReplacementPlugin()
    ],
    module: {
        rules: [
            {
                test: /\.vue$/i,
                include: APP_DIR,
                loader: require.resolve('vue-loader')
            },
            {
                test: /\.ts$/,
                include: APP_DIR,
                loader: require.resolve('ts-loader'),
                options: PnpWebpackPlugin.tsLoaderOptions({ transpileOnly: true})
            },
            {
                test: /\.js$/,
                include: APP_DIR,
                loader: require.resolve('babel-loader')
            },
            {
                test: /\.(s*)[a|c]ss$/,
                use: [
                    require.resolve("vue-style-loader"),
                    MiniCssExtractPlugin.loader,
                    require.resolve("css-loader"),
                    require.resolve("sass-loader")
                ]
            },
            {
                test: /\.(png|jpe?g|gif)$/i,
                loader: require.resolve('file-loader'),
                options: {
                    publicPath: 'assets',
                    name(resourcePath, resourceQuery) {
                        return isDev ?
                            '[path][name].[ext]' :
                            '[contenthash].[ext]'
                    },
                },
            },
        ]
    },

    devServer: {
        contentBase: [DIST_DIR, ASSETS_DIR],
        hot: true,
        port: 9000
    },
    output: {
        filename: '[name].[hash].js',
        path: DIST_DIR,
    }
};
