class Search

  def initialize(params)
    @cards = JSON.parse(File.read('./public/cards.json'))
    @search_term = params['searchTerm']
    @results = []
  end

  def find_card
    @cards.each do |card|
       @results << card if card['name'].downcase == @search_term.downcase
    end
    @results.length > 0 ? @results : find_similar_names
  end

  def find_similar_names
    @cards.each do |card|
      @results << card if card['name'].downcase.include? @search_term.downcase
    end
    @results
  end

end