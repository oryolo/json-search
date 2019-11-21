RSpec.describe "FilePresenter" do
  subject { FilePresenter.new('users.json') } 

  it 'render column names' do
    expect(subject.formatted_column_names).to be_a(String) 
    expect(subject.formatted_column_names).to include("Users", "name", "alias")
  end
end
