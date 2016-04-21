# Users
users = [{username: 'brett', email: 'brett@example.com', password_digest: '123456'},
         {username: 'mike', email: 'mike@example.com', password_digest: '123456'},
         {username: 'john', email: 'john@example.com', password_digest: '123456'}
        ]

users.each do |user|
  User.create(user)
end


# User Locations

user_ids = [1,2,3]

150.times do UserLocation.create({user_id: user_ids.sample, lat: 40 + rand, long: 74 + rand}) end


# Tasks

tasks = [{title: 'Quick Draw', description: 'Click the button first to win.'},
         {title: 'Strength Compentition', description: 'Move your phone as fast as possible. Throwing is fair game.'},
         {title: 'Live to play another day', description: 'Run away from your challenger. Leave the battle.'}
        ]

tasks.each do |task|
  Task.create(task)
end

# Battles

task_ids = [1,2,3]

users.each do |user|
  user.battles << Battle.create({task_id: task_ids.sample, winner: 1})
end




