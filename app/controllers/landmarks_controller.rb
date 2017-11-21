class LandmarksController < ApplicationController
  get '/' do
    redirect "/landmarks"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    # redirect "/landmarks/#{@landmark.id}"
    redirect "/landmarks"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do
    # @landmark = Landmark.find(params[:id])
    # @landmark.update(params[:landmark])
    # OR
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
end
