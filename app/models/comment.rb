class Comment < ActiveRecord::Base
  #belongs to by forgien key
  belongs_to :movie
  def self.descending
    order(:created_at => :desc)
  end
end
