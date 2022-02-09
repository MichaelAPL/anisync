class DashboardController < ApplicationController
  def index
    if current_user.anime_list.empty?
      sync_anime_list
    end
  end

  protected

  def sync_anime_list
    access_token = current_user.main_provider.access_token
    refresh_token = current_user.main_provider.refresh_token
    SyncMalAnimeJob.perform_async(access_token, refresh_token, current_user.id)
  end
end
