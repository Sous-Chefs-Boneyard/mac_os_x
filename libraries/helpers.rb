def value_type(value)
  case value
  when true, false
    'bool'
  when Integer
    'int'
  when Float
    'float'
  when Hash
    'dict'
  when Array
    'array'
  end
end
