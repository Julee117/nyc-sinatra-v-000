class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    unless params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.title_ids = @title.id
    end

    unless params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmark_ids = @landmark.id
    end

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      # @title = Title.create(params[:title])
      # @figure.title_ids = @title.id
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      # @landmark = Landmark.create(params[:landmark])
      # @figure.landmark_ids = @landmark.id
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "/figures/#{@figure.id}"
  end
end
