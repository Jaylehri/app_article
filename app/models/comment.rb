class Comment < ApplicationRecord
  belongs_to :article
  #belongs_to :user
  resourcify
end
