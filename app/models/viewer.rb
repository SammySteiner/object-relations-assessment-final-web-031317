class Viewer
  attr_accessor :first_name, :last_name, :full_name

  @@all = []

  def initialize(name)
    @full_name = name
    @first_name, @last_name = name.split(" ")
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.find do |viewer|
      viewer.full_name.downcase == name.downcase
    end
  end

  # def create_rating(score, movie)
  #   Rating.new(score, movie, self)
  # end

  def create_rating(score, movie)
    if movie.class == Fixnum
      i = movie
      movie = score
      score = i
    end
    if movie.class == String
      movie = Movie.new(movie)
    end
    if !!Movie.find_by_title(movie.title)
      Movie.new("#{movie.title}")
    end

    Rating.new(score, movie, self)
  end


end

sammy = Viewer.new("Sammy Steiner")
scott = Viewer.new("Scott Harrison")
film1 = Movie.new("Star Wars")
film2 = Movie.new("Star Trek")
sammy.create_rating(4, film1)
sammy.create_rating(1, film2)
scott.create_rating(5, film1)
scott.create_rating(film2, 3)
sammy.create_rating(3, "all I got is a name")
sammy.create_rating(4, Movie.new("foreign film"))
