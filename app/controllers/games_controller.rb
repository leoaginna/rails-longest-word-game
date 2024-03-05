require open-uri

class GamesController < ApplicationController
  def new
      @letters = []
      10.times do
        @letters << ("a".."z").to_a.sample.upcase
      end
      @letters
    end

  def score
    @words = params[:word]
    @letters = params[:letters]

    url = "https://wagon-dictionary.herokuapp.com/#{@words}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
  end

end
# The word can’t be built out of the original grid ❌
# The word is valid according to the grid, but is not a valid English word ❌
# The word is valid according to the grid and is an English word ✅