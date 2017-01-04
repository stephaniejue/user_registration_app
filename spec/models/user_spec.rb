require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created" do
    expect{User.new}.to_not raise_error
  end
end
