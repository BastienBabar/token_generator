class Company < ApplicationRecord
  tokenize! attribute: 'identity', separator: ':', block_size: 4, number_of_blocks: 2

  has_many :employees, dependent: :destroy

  validates_presence_of :name

end
