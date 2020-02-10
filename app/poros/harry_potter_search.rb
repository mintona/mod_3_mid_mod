class HarryPotterSearch
  attr_reader :state

  def initialize(house)
    @house = house
  end

  def members
    return @members if @members
    service = HarryPotterService.new
    @members = service.members_by_house(house).map do |member_data|
      Member.new(member_data)
    end
  end
end
