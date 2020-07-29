# $ rails generate model Comment commenter:string body:text article:references
# $ rails db:migrate
class Comment < ApplicationRecord
  belongs_to :article
end

