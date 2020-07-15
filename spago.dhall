{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "react-wrapper-gen"
, dependencies =
  [ "console"
  , "effect"
  , "exceptions"
  , "foldable-traversable"
  , "foreign"
  , "foreign-object"
  , "node-fs"
  , "node-path"
  , "node-process"
  , "prelude"
  , "psci-support"
  , "ordered-collections"
  , "undefinable"
  , "unicode"
  , "yargs"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
