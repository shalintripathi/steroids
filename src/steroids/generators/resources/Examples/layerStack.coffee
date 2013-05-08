steroids = require "../../../../steroids"
spawn = require("child_process").spawn
path = require "path"
fs = require "fs"
ejs = require "ejs"
util = require "util"

Base = require "../../Base"
Help = require "../../../Help"

class LayerStack extends Base

  templatePath: ->
    path.join(steroids.paths.templates.resources, "layerStack")

  generate: ->
    @checkForPreExistingFiles [
      path.join("app", "layouts", "layerStackExample.html"),
      path.join("app", "views", "layerStackExample", "index.html"),
      path.join("app", "views", "layerStackExample", "showCat.html")
    ]

    @ensureDirectory path.join("app")
    @ensureDirectory path.join("app", "views")
    @ensureDirectory path.join("app", "views", "layerStackExample")
    @ensureDirectory path.join("app", "views", "layouts")

    @copyFile path.join("app", "views", "layouts", "layerStackExample.html"), "layout.html.template"
    @addFile path.join("app", "views", "layerStackExample", "index.html"), "index.html.template"
    @addFile path.join("app", "views", "layerStackExample", "showCat.html"), "showCat.html.template"

    Help.SUCCESS()
    console.log """

    Layer stack example generated successfully! The following files were created:
    
      - app/layouts/layerStackExample.html
      - app/views/layerStackExample/index.html
      - app/views/layerStackExample/showCat.html
    
    To see the example in action, set the location of your app to:

      http://localhost/views/layerStackExample/index.html

    """

module.exports = LayerStack