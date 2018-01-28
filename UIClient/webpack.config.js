var glob_entries= require("webpack-glob-entries");
module.exports = {
    entry: glob_entries("./app/**/*.js"),
    output: { filename: "bundle.js" },
    watch: true,
    module: {
        preLoaders: 
            [
                {
                    test: /\.js$/,
                    exclude: "node_modules",
                    loader: "jshint-loader"
                }
            ]
    }
}