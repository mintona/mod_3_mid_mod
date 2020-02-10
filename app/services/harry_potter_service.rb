class HarryPotterService

  def members_by_house
    conn = Faraday.new(:url => 'https://www.potterapi.com/v1') do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get do |req|
      req.url 'characters'
      req.params['key'] = ENV['KEY']
      req.params['house'] = @house
      req.params['orderOfThePhoenix'] = true
    end

    house_members = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
# end
