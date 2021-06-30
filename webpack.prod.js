const path = require("path");

module.exports = {
  entry: path.resolve(__dirname, "src/isrtl.ts"),
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "isrtl.js",
    globalObject: "this",
    library: "isrtl",
    libraryTarget: "umd",
  },
  module: {
    rules: [
      {
        test: /\.(js)$/,
        exclude: /node_modules/,
        use: ['babel-loader'],
      },
      {
        test: /\.tsx?$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    extensions: [".js", ".ts", ".tsx", ".glsl"],
    modules: [path.resolve(__dirname, "src"), "node_modules"],
  },
  mode: "production",
};
