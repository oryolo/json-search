require 'highline/import'
require 'colorize'
require 'json'

require_relative 'search'
require_relative 'file_presenter'
require_relative 'data_file'

class App
  def start
    loop do
      say("\nWelome to Zendesk search!")
      say("Type 'q' or 'quit' to exit at any time, Press 'n' or 'next' to continue")
      
      choose do |menu|
        menu.layout = :menu_only
        menu.select_by = :name

        menu.choice(:next, {}, "(n)ext".green) { search_options }
        menu.choice(:quit, {}, "(q)uit".red) { exit }
      end
    end    
  end

  def self.start
    new.start
  end

  private

  def search_options
    choose do |menu|
      menu.header = "Select search options"
      menu.prompt = nil
      menu.index = nil
      menu.select_by = :name
      menu.index_suffix = "* "
      
      menu.choice('1', {}, "Press 1 to search in Zendesk files") { select_file }
      menu.choice('2', {}, "Press 2 to view a list of searchable fields" ) { print_column_names }
      menu.choice(:quit, {}, "Type 'q' or 'quit' to exit".red) { exit }
    end
  end
  
  def print_column_names
    Dir.glob(["*.json"], base: DataFile::DIR).each do |file| 
      puts FilePresenter.new(file).formatted_column_names 
    end
  end
  
  def select_file
    choose do |menu|
      menu.header = "Please, select file"
      menu.prompt = nil
      menu.select_by = :name
      menu.index_suffix = ") "
        
      Dir.glob(["*.json"], base: DataFile::DIR).each_with_index do |file, index| 
        menu.choice("#{index + 1}", {}, "#{File.basename(file, ".json").capitalize}") do 
          get_search_params(file) 
        end
      end
  
      menu.choice(:quit, {}, "Type 'q' or 'quit' to exit".red) { exit }
    end
  end
  
  def get_search_params(file)
    search_term = ask("Enter search term")
    search_value = ask("Enter search value")
  
    Search.new(file, search_term, search_value).search
  end
end