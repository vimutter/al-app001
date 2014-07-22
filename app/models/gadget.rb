class Gadget < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :user_id
  validates_length_of :name, maximum: 250

  validates_presence_of :description
  validates_length_of :description, maximum: 1000

  validates_presence_of :user_id
end
