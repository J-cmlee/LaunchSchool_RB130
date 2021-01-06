def hello(&foo)
  foo.call if block_given?
end

hello