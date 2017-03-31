class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    all.find do |movie|
      movie.title.downcase == title.downcase
    end
  end

  def ratings
    Rating.all.select do |rating|
      rating.movie == self
    end
  end

  def viewers
    self.ratings.map do |rating|
      rating.viewer
    end
  end

  def average_rating
    # i = 0
    # self.ratings.each do |rating|
    #   i += rating.score
    # end
    # i / self.ratings.length.to_f
    
    self.ratings.reduce(0.0) do |sum, rating|
      sum + rating.score
    end / self.ratings.length

  end
end
