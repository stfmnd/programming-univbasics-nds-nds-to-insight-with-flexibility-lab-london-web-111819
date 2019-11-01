# Provided, don't edit
require 'directors_database'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :director_name => director_name,
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio]
  }
end

# Your code after this point

def movies_with_director_key(name, movies_collection)
 counter = 0
 new_array = []
 while counter < movies_collection.length do 
   new_array.push(movie_with_director_name(name, movies_collection[counter]))
   counter += 1
 end
 new_array
end



def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  
  # RETURN:
  
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  # binding.pry
  counter = 0
  result = {}
  while counter < collection.length do 
    if result[collection[counter][:studio]]
    result[collection[counter][:studio]] += collection[counter][:worldwide_gross]
  else
    result[collection[counter][:studio]] = collection[counter][:worldwide_gross]
  end
  counter += 1
  end
  result
end

def movies_with_directors_set(source)
  counter = 0
  new_array = []
  while counter < source.length do
    new_array.push(movies_with_director_key("Byron Poodle", source[counter][:movies]))
    counter += 1
  end
  new_array[-1][-1][:director_name] = "Nancy Drew"
  new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
