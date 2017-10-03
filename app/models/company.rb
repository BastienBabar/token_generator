class Company < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates_presence_of :name

  before_create :generate_identity

  def generate_identity
    self.identity ||= Identifier::Token.new(self.class, 'identity',{ separator: ':', block_size: 4, number_of_blocks: 2 }).generate
  end
end
