class Walk < ApplicationRecord
  has_many :stations
  belongs_to :user

  validates_presence_of :name, :location, :description

  scope :is_public, -> { where(public: true) }

  def editable_by?(current_user)
    current_user && user == current_user
  end
end
