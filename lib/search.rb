require_relative 'search_presenter'
require_relative 'data_file'

class Search
  attr_accessor :term, :value
  attr_reader :presenter, :results, :data_file

  def initialize(file, term, value)
    @data_file = DataFile.new(file)
    @term = term
    @value = value
    @results = []
    @presenter = SearchPresenter.new(self)
  end

  def search
    validate_input
    get_search_results!
    
    presenter.print
    
    results
  end

  private

  def get_search_results!
    if term == 'tags'
      get_results_by_tags
    else
      get_results_by_default
    end
  end

  def get_results_by_tags
    data_file.data.each do |unit| 
      results << unit if unit["tags"].include?(value)
    end
  end

  def get_results_by_default
    data_file.data.each do |unit| 
      results << unit if unit[term] == value 
    end
  end

  def validate_input
    self.term = term.downcase
    case @value.downcase
    when 'true'
      self.value = true
    when 'false'
      self.value = false
    when /^\d+$/
      self.value = value.to_i 
    else
      # do nothing
    end
  end
end
