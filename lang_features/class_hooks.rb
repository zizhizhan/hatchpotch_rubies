# encoding: UTF-8

module ClassHook
  def inherited(base)
    hook_invoked(base, __callee__)
    super
  end

  def included(base)
    hook_invoked(base, __callee__)
    super
  end

  def extended(base)
    hook_invoked(base, __callee__)
    super
  end

  def extend_object(base)
    hook_invoked(base, __callee__)
    super
  end

  def append_features(base)
    hook_invoked(base, __callee__)
    super
  end
  private
  def hook_invoked(base, method)
    puts "#{base} #{method} #{self}."
  end

end

module Hook1
  include ClassHook
end

module Hook2
  class << self
    include ClassHook
  end
end

module Hook3
  extend ClassHook
end


#
# include把模块中的所有方法变成当前类的实例方法
#
# extend把模块中的所有方法变成当前类的类方法
#
# Hook2 等价于 Hook3

if __FILE__ == $0

  class AClass
    include Hook1
    include Hook2
    include Hook3
  end

  class BClass
    extend Hook1
    extend Hook2
    extend Hook3
  end

  class CClass
    class << self
      include Hook1
      include Hook2
      include Hook3
    end
  end

  class A1Class < AClass; end
  class B1Class < BClass; end
  class C1Class < CClass; end

end