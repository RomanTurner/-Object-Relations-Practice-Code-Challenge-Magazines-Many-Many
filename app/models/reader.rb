class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions
 

  def subscribe(magazine, price)

    attr_hash = {
      magazine_id: magazine.id, 
      reader_id: self.id, 
      price: price
    }

    Subscription.create(attr_hash)
  end

  def total_subscription_price
    self.subscriptions.sum(:price)
  end

  def cancel_subscription(magazine)

    self.subscriptions.find_by(magazine_id: magazine.id).destroy
  end
  
  
end