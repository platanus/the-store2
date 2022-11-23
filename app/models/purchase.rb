class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item

  delegate :name, to: :item, prefix: true
end

# == Schema Information
#
# Table name: purchases
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  item_id    :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_purchases_on_item_id  (item_id)
#  index_purchases_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (user_id => users.id)
#
