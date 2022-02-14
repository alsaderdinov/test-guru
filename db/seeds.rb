# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create!([
  { name: 'Alexander', email: 'example@mail.com' },
  { name: 'Angelina', email: 'example1@mail.com' }
])


categories = Category.create!([
  { title: 'Front-End' },
  { title: 'Back-End' }
])


tests = Test.create!([
  { title: 'HTML', level: 0, category_id: categories[0].id, author_id: users[0].id},
  { title: 'JavaScript', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Go', level: 3, category_id: categories[1].id, author_id: users[1].id },
  { title: 'Ruby', level: 1, category_id: categories[1].id, author_id: users[1].id }
])


questions = Question.create!([
  { body: 'Что такое HTML?', test_id: tests[0].id },
  { body: 'Где можно использовать JavaScript?', test_id: tests[1].id },
  { body: 'Сколько ключевых слов в языке Go?', test_id: tests[2].id },
  { body: 'Как называется самый популярный фреймворк языка Ruby для веба?', test_id: tests[3].id }
])


Answer.create!([
  { body: 'Язык разметки документов для просмотра веб-страниц в браузере.', correct: true, question_id: questions[0].id },
  { body: 'Язык программирования.', correct: false, question_id: questions[0].id },
  { body: 'Фреймворк.', correct: false, question_id: questions[0].id },
  { body: 'Прикладное программное обеспечение', correct: false, question_id: questions[1].id },
  { body: 'Веб-приложения', correct: false, question_id: questions[1].id },
  { body: 'Мобильные приложения', correct: false, question_id: questions[1].id },
  { body: 'Серверные приложения', correct: false, question_id: questions[1].id },
  { body: 'Можно во всех перечисленных', correct: true, question_id: questions[1].id },
  { body: '25', correct: true, question_id: questions[2].id },
  { body: '33', correct: false, question_id: questions[2].id },
  { body: '50', correct: false, question_id: questions[2].id },
  { body: 'Ruby On Rails', correct: true, question_id: questions[3].id },
  { body: 'React', correct: false, question_id: questions[3].id },
  { body: 'Laravel', correct: false, question_id: questions[3].id }
])

TestPassage.create!([
  { correct_questions: 1, test_id: tests[0].id, user_id: users[0].id },
  { correct_questions: 2, test_id: tests[1].id, user_id: users[0].id },
  { correct_questions: 3, test_id: tests[2].id, user_id: users[1].id },
  { correct_questions: 4, test_id: tests[3].id, user_id: users[1].id }
])
