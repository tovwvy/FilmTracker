class FilmsController < ApplicationController
  def index
    @films = Film.all.paginate(page: params[:page], per_page: 5)
  end

  def show
    begin
      @film = Film.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to films_path, alert: "Film not found"
    end
  end

  def destroy
    @film = Film.find(params[:id])
    if @film
      @film.destroy
      redirect_to films_path, notice: "Film deleted successfully"
    else
      redirect_to films_path, alert: "Film not found"
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    if @film.update(film_params)
      flash[:success] = "Film updated successfully"
      redirect_to @film
    else
      render 'edit'
    end
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      redirect_to films_path, notice: "Film was successfully created."
    else
      render :new
    end
  end

  private

  def permited_attributes
    params.require(:film).permit(:name, :year, :describtion, :rating, :director, :actor, :length)
  end

  def film_params
    params.require(:film).permit(:name, :year, :describtion, :rating, :director, :actor, :length)
  end
end
