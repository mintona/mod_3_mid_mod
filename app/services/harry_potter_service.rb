class HarryPotterService
  def get_members_by_house(house)
    get_json('characters', house)
  end

  private
    def conn
      conn = Faraday.new(:url => 'https://www.potterapi.com/v1') do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json(url, house)
      response = conn.get do |req|
        req.url url
        req.params['key'] = ENV['KEY']
        req.params['house'] = house
        req.params['orderOfThePhoenix'] = true
      end
      JSON.parse(response.body, symbolize_names: true)
    end
end
