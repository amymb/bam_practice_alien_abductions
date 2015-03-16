class Person < ActiveRecord::Base
  has_many :abductions
  def full_name
    first_name + ' ' + last_name
  end
end
