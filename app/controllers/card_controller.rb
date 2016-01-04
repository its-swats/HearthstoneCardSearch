class CardController < ApplicationController

  def find
    search = Search.new(params)
    render json: {cards: search.find_card}
  end

end
