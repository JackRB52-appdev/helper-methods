class DirectorsController < ApplicationController
  
  def new
    @director = Director.new
  end

  def index
    @directors = Director.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @directors
      end

      format.html
    end
  end

  def show
    @director = Director.find(params.fetch(:id))
  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob, :bio)
    @director = Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to directors_url, notice: "Director created successfully"
    else
      render template: "new"
    end
  end

  def edit
    @director = Director.find(params.fetch(:id))
  end

  def update
    director = Director.find(params.fetch(:id))
    director_attributes = params.require(:director).permit(:name, :dob, :bio)
    director.update(director_attributes)

    if director.valid?
      director.save
      redirect_to director_url(director), notice: "Director updated successfully."
    else 
      redirect_to director_url(director), alert: "Director failed to update successfully."
    end
  end

  def destroy
      director = Director.find(params.fetch(:id))

      director.destroy
      redirect_to directors_url, notice: "Director deleted successfully."
  end
end
