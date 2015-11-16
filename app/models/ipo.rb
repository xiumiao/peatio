class Ipo < ActiveRecord::Base
  belongs_to :ipo_applicant
  has_many :ipo_numbers
  belongs_to :member
  has_many :account_versions, as: :modifiable

end
