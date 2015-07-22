class PageController < ApplicationController
  def home
  end

  def about_us
  end

  def products
  end

  def contact_us
    @submitted = params["commit"]
    @form_error = false
    @name = params["name"]
    if(@name == "")
      #@error_msg = "Must enter your name !"
      flash.now['error'] = "Must enter your name !"
      @form_error = true
    end
    @email = params["email"]
    @question = params["question"]
    #to make checkbox sticky , checkbox remain checked after submit button pressed
    @newsletter = params["newsletter"] == "newsletter"
    gender = params['gender']
    #boolean expression
    @male = gender == "Male" #true or false
    @female = gender == "Female" #true or false
    @product = params["product"]
  end

  def newsletter
  end

  def blog
  end

  def calendar
    @time = Time.now
    @month = params["month"].to_i
    @year = params["year"].to_i
    if(!(@month >=1 && @month <= 12))
      @month = @time.strftime('%m').to_i
    end
    if(@year <= 0)
      @year = @time.strftime('%Y').to_i
    end
  end

  def articles
  end

  def login
  end
  def sign_out

  end
end
