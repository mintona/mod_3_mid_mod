class Member
  attr_reader :name, :house, :role, :patronus

  def initialize(member_info)
    @name = member_info[:name]
    @house = member_info[:house]
    @role = member_info[:role]
    @patronus = member_info[:patronus]
  end
end
