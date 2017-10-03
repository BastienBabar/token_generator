class Employee < ApplicationRecord
  belongs_to :company, touch: true

  validates_presence_of :first_name, :last_name

  before_create :generate_identifier

  def generate_identifier
    self.identifier ||= Identifier::Token.new(self.class, 'identifier',{ separator: '-', block_size: 4, number_of_blocks: 3 }).generate
  end
end
