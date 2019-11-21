require_relative 'data_file'

class FilePresenter
  def initialize(file)
    @data_file = DataFile.new(file)
  end

  def formatted_column_names
    result = "-" * 20
    result += "\nSearch #{@data_file.title.capitalize.green} with\n"
    
    @data_file.data[0].keys.each do |name|
      result += name + "\n"
    end
    result
  end
end