class SearchController < ApplicationController
  def index
    render locals: {
      member_search: HarryPotterSearch.new(params[:house])
    }
  end
end
