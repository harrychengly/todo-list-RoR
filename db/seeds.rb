5.times do 
    Listing.create({
        category: Faker::TvShows::GameOfThrones.house,
        body: Faker::TvShows::GameOfThrones.character
    })
end