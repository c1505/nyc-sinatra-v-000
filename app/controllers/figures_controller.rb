class FiguresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/figures") }

  get '/figures/new' do
    erb :new
  end

  get '/figures' do
    @figures = Figure.all 
    erb :index
  end

  get '/figures/:id' do

    @figure = Figure.find(params[:id])
    erb :show
  end

  post '/figures' do
    @figure = Figure.new(name: params[:figure][:name])
    unless params[:figure][:title_ids].nil?
      params[:figure][:title_ids].each do |id|
        title = Title.find(id)
        @figure.titles << title
      end
    end
    @figure.save

    unless params[:figure][:landmark_ids].nil?
      params[:figure][:landmark_ids].each do |id|
        landmark = Landmark.find(id)
        @figure.landmarks << landmark
      end
    end
    @figure.save

    @figure.landmarks.build(name: params[:landmark][:name])
    @figure.titles.build(name: params[:title][:name])
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :edit 
  end

  patch '/figures/:id' do #need to finish this update
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    @figure.landmarks.build(name: params[:landmark][:name])
    @figure.save
    @figure.titles.build(name: params[:title][:name])
    @figure.save
    redirect "/figures/#{@figure.id}"
  end


end
# FiguresController
#   allows you to view form to create a new figure (FAILED - 1)
#   allows you to create a new figure with a title (FAILED - 2)
#   allows you to create a new figure with a landmark (FAILED - 3)
#   allows you to create a new figure with a new title (FAILED - 4)
#   allows you to create a new figure with a new landmark (FAILED - 5)
#   allows you to list all figures (FAILED - 6)
#   allows you to see a single Figure (FAILED - 7)
#   allows you to view form to edit a single figure (FAILED - 8)
#   allows you to edit a single figure (FAILED - 9)
