class TeamsController < ApplicationController
  HEADERS = { "Authorization" => "Token token=#{ENV['API_KEY']}", 'X-User-Email' => ENV['API_EMAIL'] }

  def index
    @teams = Unirest.get(
      "#{ENV['API_BASE_URL']}/teams",
      headers: HEADERS
      ).body
    render 'index.html.erb'
  end

  def show
    @team = Unirest.get(
      "#{ENV['API_BASE_URL']}/teams/#{params[:id]}"
      ).body
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @team = Unirest.post(
      "#{ENV['API_BASE_URL']}/v2/teams",
      parameters: {
        state: params[:state],
        team: params[:team],
        city: params[:city]
        }
        ).body
    redirect_to "#{ENV['API_BASE_URL']}/teams/#{@team["id"]}"
  end

  def edit
    @team = Unirest.get(
      "#{ENV['API_BASE_URL']}/teams/#{params[:id]}"
      ).body
    render 'edit.html.erb'
  end

  def update
    @team = Unirest.patch(
      "#{ENV['API_BASE_URL']}/teams/#{params[:id]}",
      parameters: {
        state: params[:state],
        team: params[:team],
        city: params[:city]
        }
        ).body
    redirect_to "#{ENV['API_BASE_URL']}/teams/#{params[:id]}"
  end

  def delete
  
  end
end
