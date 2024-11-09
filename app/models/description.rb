class Description < ApplicationRecord
  
  belongs_to :article
  validates :content, uniqueness: true

end
