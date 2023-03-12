class Email < ApplicationRecord
  validates :received, presence: true, unless: ->(email) { email.description.present? }
  validates :description, presence: true, unless: ->(email) { email.received.present? }
end
