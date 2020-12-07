class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  has_one_attached :image
  #has_many_attached :images
  after_create :send_mail
 # belongs_to :user
  resourcify
  def send_mail
    WelcomeMailer.send_welcome_mail(self.email).deliver
  end
end