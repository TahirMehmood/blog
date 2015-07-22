class Movie < ActiveRecord::Base
  has_many :comments , :dependent => :destroy
  validates_presence_of :name ,:director
  validates_numericality_of :year , :length, :greater_than => 0
  validates_uniqueness_of :name , :message => "is alreday used dimwit"
  # validates_length_of :format, :maximum => 5 ,:minimum => 2
  #max_paginates_per 6
  paginates_per 6

  def proper_name
    name.titleize
  end


end
