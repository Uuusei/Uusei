class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         has_many :diets
         has_many :diets, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_diets, through: :likes, source: :diet

         def already_liked?(diet)
          self.likes.exists?(diet_id: diet.id)
         end
         has_many :comments, dependent: :destroy

         has_many :diets, dependent: :destroy
         validates :name, presence: true
         validates :profile, length: { maximum: 200 }

         
         has_many :works
         has_many :works, dependent: :destroy
         has_many :dislikes, dependent: :destroy
         has_many :disliked_works, through: :dislikes, source: :work

         def already_disliked?(work)
          self.dislikes.exists?(work_id: work.id)
         end
         has_many :nocomments, dependent: :destroy

         has_many :works, dependent: :destroy
         validates :name, presence: true
         validates :profile, length: { maximum: 200 }

end
