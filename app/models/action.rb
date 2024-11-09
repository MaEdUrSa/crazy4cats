class Action < ApplicationRecord
  belongs_to :article
  belongs_to :customer

  validates :kind, acceptance: {
    accept: %w[like dislike ],
  }  

  def self.kinds
      %w[like dislike ]
  end
end
