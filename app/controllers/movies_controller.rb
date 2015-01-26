class MoviesController < InheritedResources::Base

  private

    def movie_params
      params.require(:movie).permit(:title, :release_year, :price, :description, :imdb_id, :poster_url)
    end
end

