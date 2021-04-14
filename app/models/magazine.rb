class Magazine < ActiveRecord::Base
  has_many :subscriptions 
  has_many :readers,  through: :subscriptions

    def email_list
      list = []
      self.readers.each do |r|
       list << r.email
      end
      list.join(";")
    end

    def self.most_popular
      self.all.sort_by {|m| m.readers.count}.last
    end

end