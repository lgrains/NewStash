require 'spec_helper'

describe User do
  subject { Factory(:user) }
  it { should be_valid }

  #associations
  it {should belong_to :role}

  #validations
  it {should validate_presence_of :email}

  # testing attr_accessible
  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :password }
  it { should allow_mass_assignment_of :password_confirmation }
  it { should allow_mass_assignment_of :remember_me }

  describe "#role_symbols" do

    it "should return [:cousin]" do
      subject.role_symbols.should == [:cousin]
    end

    it "should return [:admin]" do
      user = Factory(:admin)
      user.role_symbols.should == [:admin]
    end
  end

end
