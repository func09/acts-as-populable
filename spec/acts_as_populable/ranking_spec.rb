require File.expand_path('../../spec_helper', __FILE__)
describe ActsAsPopulable::Ranking do
  before(:each) do
    clean_database!
  end
  subject {ActsAsPopulable::Ranking}
  it {should respond_to(:update).with(2).arguments}
  context 'a new instance' do
    before do
      @ranking = ActsAsPopulable::Ranking.new
      @ranking.valid?
    end
    subject { @ranking }
    it {should respond_to(:ranking_name)}
    it {should respond_to(:score)}
    it {should respond_to(:populable)}
    its(:valid?) { should be_false }
    #it { should have(1).errors_on(:ranking_name) }
  end
  
end