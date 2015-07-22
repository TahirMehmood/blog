class Person < ActiveRecord::Base
  def full_name
    # + return error if first_name is nil
    return first_name + " " + last_name + ","
  end
  def describe
    return "#{full_name} is #{age} years old and has hair color #{hair_color}"
  end
end
