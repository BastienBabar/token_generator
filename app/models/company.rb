class Company < ApplicationRecord
  has_many :employees, dependent: :destroy

  before_create :generate_identity

  def generate_identity
    self.identity ||= Identifier::Token.new(':', 4, 2, self.class, 'identity').generate
  end
end
