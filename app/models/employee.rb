class Employee < ApplicationRecord
  belongs_to :company, touch: true

  before_create :generate_identifier

  def generate_identifier
    self.identifier ||= Identifier::Token.new('-',4, 3, self.class, 'identifier').generate
  end
end
