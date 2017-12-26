
library(tidyverse)
library(keras)
np <- import("numpy", convert=FALSE)

# Read ratings data
ratings = read.csv("data/ml-latest-small/ratings.csv", stringsAsFactors = FALSE)
head(ratings)

str(ratings)

movie_names = read.csv("data/ml-latest-small/movies.csv")
head(movie_names)

users = unique(ratings$userId)
movies = unique(ratings$movieId)

usersdf = data.frame(cuserId = seq(1, length(users)), userId = users)
moviesdf = data.frame(cmovieId = seq(1, length(movies)), movieId = movies)

ratings = inner_join(ratings, usersdf, by = "userId")
ratings = inner_join(ratings, moviesdf, by = "movieId")

ratings = ratings %>% select(-userId, -movieId) %>% rename(userId = cuserId, movieId = cmovieId)

summary(ratings)

n_users = length(unique(ratings$userId))
n_movies = length(unique(ratings$movieId))
n_users; n_movies

n_factors = 50

set.seed(1234)

ratingsRows = seq(1:nrow(ratings))
trainRows = sample(1:nrow(ratings), round(0.8*nrow(ratings)), replace = FALSE)
valRows = ratingsRows[!(ratingsRows %in% trainRows)]

length(unique(c(trainRows, valRows)))

trn = ratings[trainRows,]
val = ratings[valRows,]

user_in = layer_input(shape = c(1), dtype = 'int64', name = 'user_in')
u = user_in %>% layer_embedding(input_dim = n_users, output_dim = n_factors, input_length = 1, embeddings_regularizer = regularizer_l2(1e-4))

movie_in = layer_input(shape = c(1), dtype = 'int64', name = 'movie_in')
m = movie_in %>% layer_embedding(input_dim = n_movies, output_dim = n_factors, input_length = 1, embeddings_regularizer = regularizer_l2(1e-4))

x = layer_dot(c(u, m), axes = 2) %>% layer_flatten()
model = keras_model(inputs = c(user_in, movie_in), outputs = x)

summary(model)

model %>% compile(optimizer = optimizer_adam(0.001), loss = "mse")

model %>% fit(list(trn$userId, trn$movieId), trn$rating, batch_size = 64, epochs = 1,
              validation_data = list(list(np$array(val$userId), np$array(val$movieId)), val$rating))

model$optimizer$lr = 0.001

model %>% fit(list(trn$userId, trn$movieId), trn$rating, batch_size = 64, epochs = 6,
              validation_data = list(c(np$array(val$userId), np$array(val$movieId)), val$rating))

