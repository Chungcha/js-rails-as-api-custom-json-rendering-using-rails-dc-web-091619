class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds, except: [:created_at, :updated_at] which is actually
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])

    if bird 
      # render json: {id: bird.id, name: bird.name, species: bird.species } 
      # render json: bird, only: [:id, :species]
      render json: bird, except: [:created_at, :updated_at]
    else 
      render json: { message: 'Bird not found' }
    end
  end
end