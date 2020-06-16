# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_likes_on_post_id              (post_id)
#  index_likes_on_user_id              (user_id)
#  index_likes_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # post_idとuser_idの組み合わせに対してユニークネスのバリデーションをかける
  # validates :post_id, uniquness: trueとすると、誰かがいいねしたら他に誰もいいねできなくなる
  # scopeは範囲を指定する。複数カラムも指定可
  validates :post_id, uniqueness: { scope: :user_id }
end
