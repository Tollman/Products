requiredProcessEnv = (name) ->
  throw new Error "You must set the
    #{name} environment variable" unless process.env[name]

  return process.env[name]

path = require("path")
_ = require("lodash")

# All configurations will extend these options
# ============================================
all =
  env: process.env.NODE_ENV

  # Root path of server
  root: path.normalize(__dirname + "/../../..")

  # Server port
  port: process.env.PORT or 9000

  # Should we populate the DB with sample data?

# Export the config object based on the NODE_ENV
# ==============================================
module.exports = _.merge all, require "./#{process.env.NODE_ENV}" or {}
