# Users
users = [{username: 'brett', email: 'brett@example.com', password_digest: '123456', image_url: 'http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-alien-monster.png'},
         {username: 'mike', email: 'mike@example.com', password_digest: '123456', image_url: 'http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-nerd-pug.png'},
         {username: 'john', email: 'john@example.com', password_digest: '123456', image_url: 'http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-ponsy-deer.png'}
        ]

users.each do |user|
  User.create(user)
end
puts 'Added users'

# User GeoLocations

user_ids = [1,2,3]

150.times do Geolocation.create({user_id: user_ids.sample, lonlat: "POINT (#{-74.00 - rand} #{40.71 + rand})"}) end

puts 'Added user geolocations'

# Tasks

tasks = [{title: 'Quick Draw', description: 'Click the button first to win.'},
         {title: 'Strength Compentition', description: 'Move your phone as fast as possible. Throwing is fair game.'},
         {title: 'Live to play another day', description: 'Run away from your challenger. Leave the battle.'}
        ]

tasks.each do |task|
  Task.create(task)
end

puts 'Added tasks'

# Battles

task_ids = [1,2,3]

25.times do User.find(user_ids.sample).battles << Battle.create({task_id: task_ids.sample, winner: task_ids.sample}) end

puts 'Added battles'
