RSpec.describe "DataFile" do
  let(:file) { DataFile.new('users.json') }

  it 'has an attribute file_path' do
    expect(file.file_path).to be_a(String) 
    expect(file.file_path).to match(/^.*\.(json)$/) 
  end

  it 'has a data attribute' do
    expect(file.data).to be_a(Array)
    expect(file.data[0]).to include("name", 'email')
  end

  it 'has a title attribute' do
    expect(file.title).to eq('users')
  end
end
