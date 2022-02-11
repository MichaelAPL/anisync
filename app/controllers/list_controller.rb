class ListController < ApplicationController
  def index
    @elements = {
      list: current_user.anime_list,
      provider: current_user.main_provider
    }
  end
end
