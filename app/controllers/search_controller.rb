class SearchController < ApplicationController
  def index
    render locals: {
      house: params[:house],
      members: HarryPotterSearch.new(params[:house]).members
    }
    # Was trying to refactor. What is below was passing all the tests prior to starting
    # to refactor, which I didn't finish.
    #
    # @house = params[:house]
    #
    # conn = Faraday.new(:url => 'https://www.potterapi.com/v1') do |faraday|
    #   faraday.adapter Faraday.default_adapter
    # end
    #
    # response = conn.get do |req|
    #   req.url 'characters'
    #   req.params['key'] = ENV['KEY']
    #   req.params['house'] = @house
    #   req.params['orderOfThePhoenix'] = true
    # end
    #
    # house_members = JSON.parse(response.body,symbolize_names: true)
    #
    # @members = house_members.map do |member_info|
    #   Member.new(member_info)
    # end
  end
end
