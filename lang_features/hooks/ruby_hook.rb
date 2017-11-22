# encoding: UTF-8

module RubyHook

  class Class1
    class << self
      def inherited(*args)
        puts "#{args} #{__callee__} #{self}"
      end
    end

    def c1m1

    end

    def c1m2

    end
  end

  module Module1
    class << self
      def inherited(*args)
        puts "#{args} #{__callee__} #{self}"
      end

      def included(*args)
        puts "#{args} #{__method__} #{self}"
      end

      def extended(*args)
        puts "#{args} #{__method__} #{self}"
      end

      def append_features(*args)
        puts "#{args} #{__method__} #{self}"
        super
      end

      def extend_object(*args)
        puts "#{args} #{__method__} #{self}"
        super
      end

      def m1s1

      end

      def m1s2

      end
    end

    def m1m1

    end

    def m1m2

    end
  end

  module Module2
    class << self
      def inherited(*args)
        puts "#{args} #{__callee__} #{self}"
      end

      def included(*args)
        puts "#{args} #{__method__} #{self}"
      end

      def extended(*args)
        puts "#{args} #{__method__} #{self}"
      end

      def append_features(*args)
        puts "#{args} #{__method__} #{self}"
        super
      end

      def extend_object(*args)
        puts "#{args} #{__method__} #{self}"
        super
      end

      def m2s1

      end

      def m2s2

      end
    end

    def m2m1

    end

    def m2m2

    end
  end

  class HereGo < Class1
    include Module1
    extend  Module2
  end

  p HereGo.methods - Module.methods
  p HereGo.new.methods  - Object.new.methods

end

