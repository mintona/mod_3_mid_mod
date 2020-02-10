class HarryPotterSearch
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def members
    service = HarryPotterService.new

    @members = service.get_members_by_house(@house).map do |member_info|
      Member.new(member_info)
    end
  end

  def number_of_members
    members.count
  end
end
