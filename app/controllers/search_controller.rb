class SearchController < ApplicationController
  def index
    house = params[:house]

    api_key = ENV['KEY']

    conn = Faraday.new(:url => 'https://www.potterapi.com/v1') do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get do |req|
      req.url 'characters'
      req.params['key'] = api_key
      req.params['house'] = house
      req.params['orderOfThePhoenix'] = true
    end

    house_members = JSON.parse(response.body)

    @members = house_members.map do |member|
      Member.new(member_info)
    end
    # response = conn.get do |req|
    #   req.url 'houses'
    #   req.params['key'] = api_key
    # end
    #
    # all_houses = JSON.parse(response.body)
    #
    # house = all_houses.find { |house| house["name"] = "Gryffindor"}
    # house_id = house["_id"]
    #
    # single_house_response = conn.get do |req|
    #   req.url "houses/#{house_id}"
    #   req.params['key'] = api_key
    # end
    #
    # single_house = JSON.parse(single_house_response.body).first
    #
    # members = single_house["members"]
    require "pry"; binding.pry
  end
end
