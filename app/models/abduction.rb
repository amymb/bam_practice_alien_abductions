class Abduction < ActiveRecord::Base
  belongs_to :person
  belongs_to :alien

  def butt_stuff
    if anal_probe
      return "butt stuff"
    else
      return "no butt stuff"
    end
  end
end
