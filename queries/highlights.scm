; Methods

(method_declaration
  name: (identifier) @function.method)
(method_invocation
  name: (identifier) @function.method)
(super) @function.builtin

; Annotations

(annotation
  name: (identifier) @attribute)
(marker_annotation
  name: (identifier) @attribute)

"@" @operator

; Types

(type_identifier) @type

(interface_declaration
  name: (identifier) @type)
(class_declaration
  name: (identifier) @type)
(enum_declaration
  name: (identifier) @type)
(annotation_type_declaration
  name: (identifier) @type)

((field_access
  object: (identifier) @type)
 (#match? @type "^[A-Z]"))
((scoped_identifier
  scope: (identifier) @type)
 (#match? @type "^[A-Z]"))
((method_invocation
  object: (identifier) @type)
 (#match? @type "^[A-Z]"))
((method_reference
  . (identifier) @type)
 (#match? @type "^[A-Z]"))

(constructor_declaration
  name: (identifier) @type)

[
  (boolean_type)
  (integral_type)
  (floating_point_type)
  (void_type)
] @keyword

; Constants

((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]+$"))

; Builtins

(this) @keyword

; Literals

[
  (hex_integer_literal)
  (decimal_integer_literal)
  (octal_integer_literal)
  (decimal_floating_point_literal)
  (hex_floating_point_literal)
] @number

[
  (character_literal)
  (string_literal)
] @string
(escape_sequence) @string.escape

[
  (true)
  (false)
  (null_literal)
] @keyword

[
  (line_comment)
  (block_comment)
] @comment

; Keywords

[
  "abstract"
  "assert"
  "break"
  "case"
  "catch"
  "class"
  "continue"
  "default"
  "do"
  "else"
  "enum"
  "exports"
  "extends"
  "final"
  "finally"
  "for"
  "if"
  "implements"
  "import"
  "instanceof"
  "interface"
  "@interface"
  "module"
  "native"
  "new"
  "non-sealed"
  "open"
  "opens"
  "package"
  "permits"
  "private"
  "protected"
  "provides"
  "public"
  "requires"
  "record"
  "return"
  "sealed"
  "static"
  "strictfp"
  "switch"
  "synchronized"
  "throw"
  "throws"
  "to"
  "transient"
  "transitive"
  "try"
  "uses"
  "volatile"
  "when"
  "while"
  "with"
  "yield"
] @keyword

; Operators
[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "^="
  "|="
  "<<="
  ">>="
  ">>>="
  "+"
  "-"
  "*"
  "/"
  "%"
  "++"
  "--"
  "&&"
  "||"
  "&"
  "|"
  "^"
  "~"
  "<<"
  ">>"
  ">>>"
  "=="
  "!="
  "<"
  "<="
  ">"
  ">="
  "!"
  "?"
  ":"
] @operator

; Punctuation
[
  ";"
  ","
  "."
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

; Variables (specific contexts only)
(formal_parameter
  name: (identifier) @variable.parameter)

(catch_formal_parameter
  name: (identifier) @variable.parameter)

(variable_declarator
  name: (identifier) @variable)

(field_declaration
  declarator: (variable_declarator
    name: (identifier) @property))

(enhanced_for_statement
  name: (identifier) @variable)

; Field access
(field_access
  field: (identifier) @property)

; Assignment
(assignment_expression
  left: (identifier) @variable)

; Import and package
(import_declaration
  (scoped_identifier) @namespace)

(import_declaration
  (identifier) @namespace)

(package_declaration
  (scoped_identifier) @namespace)

; Exception types
(catch_type
  (type_identifier) @type.builtin)

; Generic parameters
(type_parameter
  (type_identifier) @type.parameter)

; Lambda parameters
(lambda_expression
  parameters: (formal_parameters
    (formal_parameter
      name: (identifier) @variable.parameter)))

; Enum constants
(enum_body
  (enum_constant
    name: (identifier) @constant))

; Constructor calls
(object_creation_expression
  type: (type_identifier) @constructor)

(object_creation_expression
  type: (generic_type
    (type_identifier) @constructor))

; Annotation names
(annotation 
  name: (scoped_identifier) @attribute)

(marker_annotation 
  name: (scoped_identifier) @attribute)
