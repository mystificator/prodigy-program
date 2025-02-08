user1 = User.create!(name: 'User1', email: 'user1@gmail.com', password: 'password', password_confirmation: 'password')
user2 = User.create!(name: 'User2', email: 'user2@gmail.com', password: 'password', password_confirmation: 'password')
user3 = User.create!(name: 'User3', email: 'user3@gmail.com', password: 'password', password_confirmation: 'password')

category1 = Category.find_or_create_by(name: "Athleticism")
category2 = Category.find_or_create_by(name: "Boosters")
category3 = Category.find_or_create_by(name: "Music")
category4 = Category.find_or_create_by(name: "Memory")
category5 = Category.find_or_create_by(name: "Creativity")
category6 = Category.find_or_create_by(name: "Languages")
category7 = Category.find_or_create_by(name: "Logic")

activity1 = category1.activities.find_or_create_by(name: "Advanced Mobility exercises", frequency: "Maximize", duration: "Max")
activity2 = category2.activities.find_or_create_by(name: "Knowledge Boosters (Follow daily plans)", frequency: "2x/Day", duration: "30 sec")
activity3 = category3.activities.find_or_create_by(name: "Visual Solfege", frequency: "1x/Day", duration: "30 sec")
activity4 = category4.activities.find_or_create_by(name: "Auditory Memory (Song 1)", frequency: "1x/Day", duration: "30 sec")
activity5 = category4.activities.find_or_create_by(name: "Auditory Memory (Song 2)", frequency: "1x/Day", duration: "40 sec")
activity6 = category5.activities.find_or_create_by(name: "Auditory Magic (Set 1)", frequency: "2 sounds/Day", duration: "60 sec")
activity7 = category5.activities.find_or_create_by(name: "Auditory Magic (Set 2)", frequency: "1 sound/Day", duration: "40 sec")
activity8 = category6.activities.find_or_create_by(name: "Talk, To Listen", frequency: "1x/Day", duration: "60 sec")
activity9 = category1.activities.find_or_create_by(name: "Finger Skills", frequency: "3x/Week", duration: "60 sec")
activity10 = category5.activities.find_or_create_by(name: "Stimulus Explosion", frequency: "3x/Week", duration: "60 sec")
activity10 = category7.activities.find_or_create_by(name: "Fundations of Logic (Quantify)", frequency: "2x/Week", duration: "60 sec")

(1..30).each do |day|
    schedule = Schedule.find_or_create_by(day: day)
  
    Activity.all.each do |activity|
      ScheduledActivity.find_or_create_by(schedule: schedule, activity: activity)
    end
end

p "Seed data created successfully"