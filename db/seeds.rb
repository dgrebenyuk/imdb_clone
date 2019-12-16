# User.create(name: email: password: password_confirmation:)
if Category.count.zero?
  Category.create([{name: 'Action'}, {name: 'Comedy'}, {name: 'Horror'}, {name: 'Thriller'}])
end

if Movie.count.zero?
  Movie.create([{ title: 'The Avengers' }, { title: 'The Nun' }])
  Movie.first.categories << Category.where('name = ? OR name = ?', 'Action', 'Comedy')
  Movie.last.categories << Category.where(name: 'Horror')
end

