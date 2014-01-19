require 'puppet'
require 'puppet/type/mysql_database'
describe Puppet::Type.type(:mysql_database) do

  before :each do
    @user = Puppet::Type.type(:mysql_database).new(:name => 'test', :charset => 'utf8', :collate => 'utf8_general_ci')
  end

  it 'should accept a database name' do
    @user[:name].should == 'test'
  end

  it 'should accept a charset' do
    @user[:charset] = 'utf8'
    @user[:charset].should == 'utf8'
  end

  it 'should accept a collate' do
    @user[:collate] = 'utf8_general_ci'
    @user[:collate].should == 'utf8_general_ci'
  end

  it 'should require a name' do
    expect {
      Puppet::Type.type(:mysql_database).new({})
    }.to raise_error(Puppet::Error, 'Title or name must be provided')
  end

end
