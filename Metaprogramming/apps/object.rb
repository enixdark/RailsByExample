

class Money
    attr_accessor :money
    def initialize(money)
        @money = money
    end
end

class Myclass

    attr_accessor :var

    def test_self
        @var = 10
        self_method
        self
    end

    def self_method
        @var = @var + 1
    end

    def my_method
        'my_method()';
    end
end

class MySubClass < Myclass

end


class C
    require_relative 'module'
    include M
end

class D < C
end