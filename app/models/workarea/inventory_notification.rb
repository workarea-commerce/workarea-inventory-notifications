module Workarea
  class InventoryNotification
    include ApplicationDocument

    field :product_id,  type: String
    field :sku,         type: String
    field :email,       type: String
    field :sent_at,     type: DateTime

    validates :product_id, presence: true
    validates :sku, presence: true
    validates :email, presence: true,
                      email: true

    index(sku: 1)

    scope :unsent, -> { where(sent_at: nil) }

    def mark_as_sent!
      update_attributes(sent_at: Time.now)
    end
  end
end
