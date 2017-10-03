require "test_helper"

describe Identifier::Token do
  let (:token) { Identifier::Token.new(Company, 'identity') }

  it "must generate a default formatted token" do
    value(token.generate).must_match /([A-Z]{4})\-([A-Z]{4})\-([A-Z]{4})\-([A-Z]{4})/
  end

  it "must return a random block of size 4" do
    value(token.random_block(4)).must_match /([A-Z]{4})/
  end

  it "must return a token with 3 blocks of size 3 with separator *" do
    value(token.generate_token(3, "*", 3)).must_match /([A-Z]{3})\*([A-Z]{3})\*([A-Z]{3})/
  end
end
