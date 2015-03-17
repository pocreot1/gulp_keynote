coffee = require 'gulp-coffee'
concatJS = require 'gulp-concat'
connect = require 'gulp-connect'
gulp = require 'gulp'
jade = require 'gulp-jade'
livereload = require 'gulp-livereload'
concatCSS = require 'gulp-minify-css'

gulp.task 'default', ['coffee', 'sass', 'jade', 'connect', 'watch']

gulp.task 'watch', ->
  livereload.listen()
  gulp.watch 'jade/*.jade', ['jade']
  gulp.watch 'coffee/*.coffee', ['coffee']
  gulp.watch 'sass/*.sass', ['sass']
  gulp.watch ['dist/main.js', 'dist/main.css'], ['minify']

gulp.task 'connect', ->
  connect.server
    root: 'dist'
    port: 4242
    livereload: true

gulp.task 'coffee', ->
  gulp.src 'coffee/*.coffee'
    .pipe coffee
    .pipe gulp.dest 'tmp/js'

gulp.task 'sass', ->
  gulp.src 'sass/*.sass'
    .pipe sass
    .pipe gulp.dest 'tmp/css'

gulp.task 'jade', ->
  gulp.src 'jade/index.jade'
    .pipe jade pretty: true
    .pipe gulp.dest 'dist'
    .pipe livereload

gulp.task 'minify', ->
  gulp.src 'tmp/js/*.js'
    .pipe concatJS 'main.js'
    .pipe gulp.dest 'dist'
    .pipe livereload

  gulp.src 'tmp/css/*.css'
    .pipe concatCSS 'main.css'
    .pipe gulp.dest 'dist'
    .pipe livereload
