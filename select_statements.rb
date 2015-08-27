require './linkedin_professionals.rb'


# Example of using the load_with_info method on an object of Class Engineer

engineer = Engineer.load_with_info("Bogdan Vasile", "24-03-2003", "30-05-2015", "Ruby and Ruby on Rails", "Web technologies")

puts "#{engineer.name} has #{engineer.experience} years of professional experience and he is a happy father of a little lovely daughter. He is now interested in learning #{engineer.interests},
especially #{engineer.specialties}"


# Defining the container as an array and creating a several objects of various user types along with name, start date, end date, specialties and interests attributes.

array_of_folks = []
array_of_folks << Doctor.load_with_info("Jim Fakedoctor", "1990-06-22", "Heart Surgery", "web development")
array_of_folks << Banker.load_with_info("Paul Fakebanker", "2000-01-26", "2014-12-26", "Counting money", "Bathe in money")
array_of_folks << Lawyer.load_with_info("Jane Fakelawyer", "1995-12-16", "2015-07-18", "Penal code", "Getting rich")
array_of_folks << Farmer.load_with_info("Cary Fakefarmer", "1996-01-18", "2012-11-29", "Great with chiks", "web development")
array_of_folks << Engineer.load_with_info("Kate Fakeengineer", "1975-10-05", "JavaScript", "web development")
array_of_folks << Banker.load_with_info("Nicholas Fakebanker", "1969-01-07", "Counting money", "Counting money")
array_of_folks << Banker.load_with_info("Johnny Fakebanker", "9-6-2005", "Counting money", "web development")
array_of_folks << Lawyer.load_with_info("John Fakelawyer", "1991-11-10", "2013-01-18", "Penal code", "Bathe in money")



puts "The following people have retired from their professional life: " + array_of_folks.select{|a| !a.working?}.map{|a| "#{a.name}, #{a.experience}"}.join('; ')
puts "The following interests are common for most people: " + array_of_folks.group_by{|a| a.interests}.select{|k, v| v.size > 1}.map(&:first).to_s