class Work < ApplicationRecord
    mount_uploader :photo, ImageUploader

    belongs_to :user
    has_many :dislikes, dependent: :destroy
    has_many :disliked_users, through: :likes, source: :user
    has_many :nocomments, dependent: :destroy

    has_many :work_tag_relations, dependent: :destroy
    has_many :tags, through: :work_tag_relations, dependent: :destroy
end
