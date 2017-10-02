module Identifier
  class Token

    def initialize(separator = '-', block_size = 4, number_of_blocks = 4, klass, attribute)
      @separator = separator
      @block_size = block_size
      @number_of_blocks = number_of_blocks
      @klass = klass
      @attribute = attribute
    end

    def generate
      token = generate_token
      while @klass.find_by(@attribute.to_sym => token).present? do
        token = generate_token
      end
      token
    end

    private

    def generate_token
      @number_of_blocks.to_i.times.map do
        random_block
      end.join(@separator.to_s)
    end

    def random_block
      [*('A'..'Z')].sample(@block_size).join
    end

  end
end
