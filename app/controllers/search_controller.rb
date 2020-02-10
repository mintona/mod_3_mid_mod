class SearchController < ApplicationController
  def index
    @house = params[:house]

    api_key = ENV['KEY']

    conn = Faraday.new(:url => 'https://www.potterapi.com/v1') do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get do |req|
      req.url 'characters'
      req.params['key'] = api_key
      req.params['house'] = @house
      req.params['orderOfThePhoenix'] = true
    end

    house_members = JSON.parse(response.body,symbolize_names: true)

    @members = house_members.map do |member_info|
      Member.new(member_info)
    end
  end
end
