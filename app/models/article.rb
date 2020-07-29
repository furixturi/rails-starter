# $ rails generate model Article title:string text:text
# $ rails db:migrate

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
end
