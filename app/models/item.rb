class Item < ApplicationRecord
  # has_one :list
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: '¥300~¥9999999の範囲で入力してください'}
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :days
end
