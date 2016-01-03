class CardController < ApplicationController

  def find
    search_term = params['searchTerm']
    file = File.read('./public/cards.json')
    json = JSON.parse(file)
    json.each do |card|
      if card['name'].downcase == search_term.downcase
        render json: {item: card}
      end
    end  
  end

end
