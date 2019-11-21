class SearchPresenter
  attr_reader :search
  
  def initialize(search)
    @search = search
  end

  def to_s
    output = ""
    if search.results.empty?
      output = "Searching in #{search.data_file.title.yellow} for #{search.term.green} with value #{search.value.to_s.green}\nNo results found"
    else
      search.results.each do |result|
        result.each do |k , v|
          output += "#{k.to_s.ljust(20)} #{v}\n"
        end
        output += "\n"
      end
    end
    output
  end

  def print
    puts to_s
  end
end