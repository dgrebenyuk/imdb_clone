# User.create(name: email: password: password_confirmation:)
if Category.count.zero?
  Category.create([{name: 'Action'}, {name: 'Comedy'}, {name: 'Horror'}, {name: 'Thriller'}])
end

if Movie.count.zero?
  Movie.create([
    {
      title: 'The Avengers',
      description: 'Earth\'s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.'
    },
    {
      title: 'The Nun',
      description: 'A priest with a haunted past and a novice on the threshold of her final vows are sent by the Vatican to investigate the death of a young nun in Romania and confront a malevolent force in the form of a demonic nun.'
    }
  ])
  Movie.first.categories << Category.where('name = ? OR name = ?', 'Action', 'Comedy')
  Movie.last.categories << Category.where(name: 'Horror')
end

