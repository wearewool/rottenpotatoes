require 'rails_helper'

RSpec.describe Movie do
  describe "call with_director function" do
    it "returns movies with the same director" do
      Movie.delete_all
      movie1 = { :title => "movie with director A", :rating => "R", :director => "directorA" }
      movie2 = { :title => "movie with director B", :rating => "PG", :director => "directorA" }
      Movie.create(movie1)
      Movie.create(movie2)

      result = Movie.with_director("directorA")
      expect(result.find { |movie| movie[:title] == "movie with director A" }).to_not be_nil
      expect(result.find { |movie| movie[:title] == "movie with director B" }).to_not be_nil
    end

    it "not return movies by different directors" do
      Movie.delete_all
      movie1 = { :title => "movie with director A", :rating => "R", :director => "directorA" }
      movie2 = { :title => "movie with director B", :rating => "PG", :director => "directorB" }
      Movie.create(movie1)
      Movie.create(movie2)

      result = Movie.with_director("directorA")
      expect(result.find { |movie| movie[:title] == "movie with director A" }).to_not be_nil
      expect(result.find { |movie| movie[:title] == "movie with director B" }).to be_nil
    end
  end
end
