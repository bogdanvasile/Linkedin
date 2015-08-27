require 'time'

# The program takes attributes for fictional user types of Linkedin
# and stores them into a container. 
# It then runs several select statements on the data 
# to get specific insight. 

# Author::    Bogdan Vasile  (mailto:bogdan.vasile.pm@gmail.com) 



# The User class holds the attributes for all types of users
# The load_with_info method allows us
# to create new user objects with the attributes 
# specified in the method. These are the attributes which are 
# used later in the program to report on.
# The working? method checks if a value exists for the user's end date
# The experience method helps measure the time (in years) 
# between a user's career start date and end date 

class User
	attr_accessor :name, :age, :sex, :role, :company, :start_date, :end_date, :specialties, :projects, :interests

	# class methods
	def User.load_with_info(n, sdate, edate=nil, s, i)
		a = User.new
		a.name = n
		a.start_date = sdate
		a.end_date = edate
		a.specialties = s
		a.interests = i
		return a
	end 

	# instance methods
	def working?
		end_date.nil?
	end


	def experience
		if working?
			a = Time.now - Time.parse(start_date)
		else
			a = Time.parse(end_date) - Time.parse(start_date)
		end

		return (a / 60 / 60 / 24 / 365).to_i
	end

end


# The follwing classes represent types of users, they inherit
# from the User class and additionally they hold attributes which are
# specific to their user type 

class Engineer< User
	attr_accessor :patents
end

class Doctor < User
	attr_accessor :published_works
end

class Banker < User
	attr_accessor :portfolio_value
end

class Lawyer < User
	attr_accessor :succesful_cases
end

class Farmer < User
	attr_accessor :livestock
end
