class Search

  def initialize(params)
    @cards = JSON.parse(File.read('./public/cards.json'))
    @search_type = params['searchType']
    @results = []
    if @search_type == 'normal'
      @search_term = params['searchTerm']
    elsif @search_type == 'advanced'
      @rarity = params['rarity'].downcase if params['rarity']
      @type = params['type'].downcase if params['type']
      @text = params['text'].downcase unless params['text'] == ""
      @cost = params['cost'].to_i unless params['cost'] == ""
      @health = params['health'].to_i unless params['health'] == ""
      @attack = params['attack'].to_i unless params['attack'] == ""
    end
  end

  def find_card
    return normal_search if @search_type == 'normal'
    return advanced_search if @search_type == 'advanced'
  end

  def normal_search
    @cards.each do |card|
       @results << card if card['name'].downcase == @search_term.downcase
    end
    @results.length > 0 ? @results : find_similar_names
  end

  def advanced_search
    @cards.each do |card|
      p card['text']
      @results << card if (card['attack'] == @attack || @attack == nil) \
                      && (card['health'] == @health || @health == nil) \
                      && (card['cost'] == @cost || @cost == nil) \
                      && (card['rarity'].downcase == @rarity || @rarity == 'all') \
                      && (card['type'].downcase == @type || @type == 'all') \
                      && (@text == nil || card['text'].downcase.include?(@text) if card['text'])
    end
    @results
  end

  def find_similar_names
    @cards.each do |card|
      @results << card if card['name'].downcase.include? @search_term.downcase
    end
    @results
  end

end