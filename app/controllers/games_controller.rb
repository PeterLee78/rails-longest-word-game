require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    answer_arr = params[:word].chars
    letter_arr = params[:letter_array].split

     valid = true

    answer_arr.each do |letter|
      unless letter_arr.include? letter
        valid = false

      end
    end

    url = `https://wagon-dictionary.herokuapp.com`
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)
    raise

    if valid
      @message = "Congratulations! #{params[:word]} is a valid English word!"

    else
      @message = "Sorry but #{params[:word]} can't be built out of #{params[:letter_array]}."

    end
  end
end
