require 'rails_helper'

RSpec.describe Member do
  it "exists" do
    member_info = {
      name: "Aberforth Dumbledore",
      house: "Gryffindor",
      role: "Owner, Hog's Head Inn",
      patronus: "goat"
    }
    member = Member.new (member_info)

    expect(member).to be_a Member
    expect(member.name).to eq("Aberforth Dumbledore")
    expect(member.house).to eq("Gryffindor")
    expect(member.role).to eq("Owner, Hog's Head Inn")
    # expect(member.order_of_the_phoenix).to eq("Aberforth Dumbledore")
    expect(member.patronus).to eq("goat")
  end

  it "can be created without a role or patronus" do
    member_info = {
      name: "Siruis Black",
      house: "Gryffindor",
    }

    member = Member.new(member_info)

    expect(member).to be_a Member
    expect(member.name).to eq("Siruis Black")
    expect(member.house).to eq("Gryffindor")
    expect(member.role).to eq(nil)
    expect(member.patronus).to eq(nil)
  end
end
