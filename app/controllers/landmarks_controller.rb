class LandmarksController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/landmarks") }

  get '/landmarks/new' do 
    erb :new
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end
  
  patch '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    erb :show
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  post '/landmarks' do
    @landmark = Landmark.new(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end



end
# LandmarksController
#   allows you to view form to create a new landmark (FAILED - 10)
#   allows you to create a new landmark (FAILED - 11)
#   allows you to list all landmarks (FAILED - 12)
#   allows you to see a single landmark (FAILED - 13)
#   allows you to view form edit a single landmark (FAILED - 14)
#   allows you to edit a single landmark (FAILED - 15)
