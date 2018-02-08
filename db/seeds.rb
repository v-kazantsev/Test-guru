# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_list = %w[
  Programming
  Database
  Administrating
  Frontend
]
categories_list.each do |title|
  Category.create!(title: title)
end
tests_list = [
  ['Ruby', 0, 1],
  ['Ruby', 1, 1],
  ['Java', 1, 1],
  ['Java', 2, 1],
  ['MySQL', 0, 2],
  ['MySQL', 1, 1]
]
tests_list.each do |title, level, category_id|
  Test.create!(title: title, level: level, category_id: category_id)
end
questions_list = [
  ['Demonstrate two ways to create an empty hash', 1],
  ['Build a hash with two symbols as keys that each have different strings as values', 1],
  ['Demonstrate how to pass a key into a hash', 1],
  ['What is returned if you pass a key that doesnt exist into a hash?', 1],
  ['Demonstrate how to change the value assoc with a key in a hash', 1]
]
questions_list.each do |body, test_id|
  Question.create!(body: body, test_id: test_id)
end
answers_list = [
  ['{}', 1, true],
  ['[]', 1],
  ['Hash.new', 1, true],
  ['newhash = { :one => "uno", :two => "dos"}', 2, true],
  ['newhash = {one: "uno", two: "dos"}', 2, true],
  ['newhash = [;one => "uno", :two => "dos"]', 2],
  ['newhash[:one]', 3, true],
  ['newhash[:one] = "one"', 3],
  ['newhash{:one}', 3],
  ['nil', 4, true],
  ['false', 4],
  ['true', 4],
  ['newhash[:one] = "fixed"', 5, true],
  ['newhash[:one] << "fixed"', 5],
  ['newhash{:one} = "fixed"', 5]
]
answers_list.each do |body, question_id|
  Answer.create!(body: body, question_id: question_id)
end
