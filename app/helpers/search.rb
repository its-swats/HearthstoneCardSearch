class Search

  def initialize(params)
    @cards = JSON.parse(File.read('./public/cards.json'))
    @search_type = params['searchType']
    @search_term = params['searchTerm']
    @rarity = params['rarity']
    @type = params['type']
    @mechanic = params['mechanic']
    @cost = params['cost']
    @health = params['health'].to_i if params['health'].length > 0 
    @attack = params['attack'].to_i if params['attack'].length > 0
    p params['health'].length
    p @attack
    p @health
    @results = []
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
      @results << card if card['attack'] == @attack && card['health'] == @health
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