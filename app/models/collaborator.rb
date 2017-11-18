class Collaborator < ApplicationRecord
  has_and_belongs_to_many :wikis

  validates :wiki, presence: true
end