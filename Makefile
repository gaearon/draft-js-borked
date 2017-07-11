PATH := ../node_modules/.bin:$(PATH)
SHELL := /bin/bash
BIN = ./node_modules/.bin
VERSION=`cat ./VERSION`
NAME=`cat ./NAME`

watch:
	@$(BIN)/watchify -t [ babelify --presets [ babel-preset-es2015 babel-preset-stage-0 babel-preset-react ]  ] -o bundle-dev.js -v -d app.js

build:
	@$(BIN)/browserify -t [ babelify --presets [ babel-preset-es2015 babel-preset-stage-0 babel-preset-react ] ] app.js > bundle-dev.js
	NODE_ENV=production $(BIN)/browserify -t [ babelify --presets [ babel-preset-es2015 babel-preset-stage-0 babel-preset-react ] ] app.js | uglifyjs -cm > bundle.js

dev:
	@$(BIN)/browserify -t [ babelify --presets [ babel-preset-es2015 babel-preset-stage-0 babel-preset-react ] ] app.js > bundle-dev.js


