
# require "identifier/active_record/token"

class Employee < ApplicationRecord
  tokenize! attribute: 'identifier', separator: '-', block_size: 4, number_of_blocks: 3

  belongs_to :company, touch: true

  validates_presence_of :first_name, :last_name

end
