RSpec.describe "SearchPresenter" do
  let(:search) { Search.new('users.json', 'name', 'Francisca Rasmussen' ) }
  let(:search_empty) { Search.new('users.json', 'name', 'Rasmussen') }
  
  context "render search results" do
    subject { SearchPresenter.new(search) }   

    it '#to_s' do
      expect(subject.to_s).to include("Francisca Rasmussen")
    end
  end

  context "render message if nothing was found" do
    subject { SearchPresenter.new(search_empty) }

    it "#to_s" do
      expect(subject.to_s).to include("name") 
      expect(subject.to_s).to include("Rasmussen") 
      expect(subject.to_s).to include("No results found") 
    end
  end
end
