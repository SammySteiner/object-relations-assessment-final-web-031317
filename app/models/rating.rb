class Rating
  attr_accessor :score, :viewer, :movie

  @@all = []

  def initialize(score, movie, viewer)
    @score = score
    @viewer = viewer
    @movie = movie
    @@all << self
  end

  def self.all
    @@all
  end

end
