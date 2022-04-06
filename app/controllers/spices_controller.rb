class SpicesController < ActionController::API
    
    def index 
        spices = Spice.all 
        render json: spices, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: {errors: invalid.record.errors}, status: :not_found
    end

    def create
        spice = Spice.create!(spice_params)
        render json: spice, status: :created 
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def update 
        spice = Spice.find(params[:id])
        spice.update!(spice_params)
        render json: spice, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end



    def destroy 
        spice = Spice.find(params[:id])
        spice.destroy 
    rescue ActiveRecord::RecordInvalid => invalid
         render json: {errors: invalid.record.errors}, status: :not_found
    end


    private 

    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
  
  