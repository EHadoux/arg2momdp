require "arg2momdp/version"

module Arg2MOMDP
  autoload :Lexer,       "arg2momdp/lexer"
  autoload :Parser,      "arg2momdp/parser"
  autoload :Alternative, "arg2momdp/objects/alternative"
  autoload :Modifier,    "arg2momdp/objects/modifier"
  autoload :Predicate,   "arg2momdp/objects/predicate"
  autoload :Rule,        "arg2momdp/objects/rule"

  module POMDPX
    autoload :XMLBuilder,          "arg2momdp/xmlbuilder"
    autoload :POMDPX,              "arg2momdp/objects/pomdpx/pomdpx"
    autoload :Agent,               "arg2momdp/objects/pomdpx/agent"
    autoload :Opponent,            "arg2momdp/objects/pomdpx/opponent"
    autoload :PublicSpace,         "arg2momdp/objects/pomdpx/public_space"
    autoload :Helpers,             "arg2momdp/objects/pomdpx/xmlbuilder/xmlhelper"
    autoload :VariableBuilder,     "arg2momdp/objects/pomdpx/xmlbuilder/variablebuilder"
    autoload :InitialStateBuilder, "arg2momdp/objects/pomdpx/xmlbuilder/initialstatebuilder"
  end
end
