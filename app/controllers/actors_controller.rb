class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new_form
  end

  def create_row
    @actor = Actor.new
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    render("show")
  end

  def edit_form
    @director=Director.find(params[:id])
    @actor = Actor.find(params[:id])
  end

  def update_row
    @actor = Actor.find(params[:id])
    @director=Director.find(params[:id])
    i = Director.find(@director)
    i.name=params["the_name"]
    i.bio=params["the_bio"]
    i.dob=params["the_dob"]
   i.image_url=params["the_image_url"]
   i.save
    redirect_to action:"show"
end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy
  end
end
