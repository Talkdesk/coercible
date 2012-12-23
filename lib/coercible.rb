module Coercible
  EXTRA_CONST_ARGS = (RUBY_VERSION < '1.9' ? [] : [ false ]).freeze
end

require 'date'
require 'time'
require 'bigdecimal'
require 'bigdecimal/util'
require 'set'

require 'descendants_tracker'
require 'support/options'
require 'support/type_lookup'

require 'coercible/version'

require 'coercible/coercer'
require 'coercible/coercer/object'

require 'coercible/coercer/numeric'
require 'coercible/coercer/float'
require 'coercible/coercer/integer'
require 'coercible/coercer/decimal'

require 'coercible/coercer/string'
require 'coercible/coercer/symbol'

require 'coercible/coercer/time_coercions'
require 'coercible/coercer/date'
require 'coercible/coercer/date_time'
require 'coercible/coercer/time'

require 'coercible/coercer/false_class'
require 'coercible/coercer/true_class'

require 'coercible/coercer/array'
require 'coercible/coercer/hash'
