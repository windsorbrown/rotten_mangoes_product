class MoviesController < ApplicationController
  
  def index
   # if params[:search] || params[:duration]
  #   @movies = Movie.search(params[:search] ||= "", params[:duration] ||="")
     if params[:movie]
      min_value, max_value = params[:movie][:duration].split('-')
      @movies = Movie.title_director_search(params[:movie][:search])
      .duration_search(min_value, max_value)
      .page(params[:page])
    else
      @movies = Movie.all.page(params[:page])
    end

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  
  protected

  def movie_params
    params.require(:movie).permit(
    :title, :release_date, :director, :runtime_in_minutes, :image, :remote_image_url, :description)
    
  end

end
