class Api::ClothsController < ApiController
    def index
        render json: Cloth.all
    end
    def show
        cloth=Cloth.find_by(id: params[:id])
        if cloth
            render json:cloth, include: :feedbacks
        else
            render json:{error: 'Cloth not found'}, status:404
        end
    end
    def search
        render json: Cloth.where('name ILIKE ?',"%#{params[:name]}%")
    end

    def create  
      location = Location.find(params[:location_id]) 
      cloth= location.cloths.new(name: params[:name], description: params[:description], cost: params[:cost], location_id: [:location_id]) 
      if cloth.save
        render json:cloth
      else
        render json: {error: 'Cannot create cloth'}, status:404
      end
    end
    def update
        cloth = Cloth.find(params[:id])
        cloth.name = params[:firstname] || cloth.name
        cloth.description = params[:description] || cloth.description
        cloth.cost = params[:cost] || cloth.cost
        cloth.location_id = params[:location_id] || cloth.location_id
      
        if cloth.update(name: cloth.name, description: cloth.description, cost: cloth.cost, location_id: cloth.location_id)
          render json: cloth
        else
          render json: { error: 'Update Failed' }, status: 404
        end
    end
    def destroy
        cloth = Cloth.find(params[:id])
        if cloth.destroy!
          render json: { message: 'Delete Successful' }, status: 200
        else
          render json: { error: 'Delete Failed' }, status: 404
        end
    end
    
end