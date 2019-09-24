require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    doc 
  end 
  
  def get_courses
    get_page.css(".posts-holder h2")
  end 
  
  def make_courses
   result = get_courses.each{|course| puts "#{course.text}"}
   binding.pry
  end 
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end


Scraper.new.get_page
