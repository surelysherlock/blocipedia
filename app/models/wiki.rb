class Wiki < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :collaborators
end
