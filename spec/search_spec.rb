RSpec.describe Search do
  
  before do
    allow_any_instance_of(SearchPresenter).to receive(:print)
  end

  context 'with matching results' do
    subject { Search.new('users.json', 'name', 'Francisca Rasmussen' ) } 
    let(:search) { subject.search } 

    it 'returns an array' do
      expect(search).to be_a(Array)
      expect(search.size).to eq(1)
      expect(search.last["name"]).to eq("Francisca Rasmussen")
    end
  end

  context "without matching results" do
    subject { Search.new('users.json', 'name', 'John Snow' ) } 
    let(:search) { subject.search } 

    it 'returns an empty array' do
      expect(search).to be_a(Array)
      expect(search.size).to eq(0)
    end    
  end
end
