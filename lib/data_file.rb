class DataFile
  attr_reader :file_path, :data, :title
  
  DIR = File.expand_path("../data", __dir__)

  def initialize(file_name)
    @file_path = DIR + "/" + file_name
    @data = parse_data(@file_path)
    @title = File.basename(@file_path, ".*")
  end

  private

  def parse_data(file_path)
    json_data = File.read(file_path)
    JSON.parse(json_data)
  end 
end