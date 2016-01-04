class Search

    def initialize(params = {})
        @cards = JSON.parse(File.read('./public/cards.json'))
        # @cards = JSON.parse(cards)
        @search_term = params['searchTerm'].downcase
        p @cards
    end

    def search 
        
    end

end