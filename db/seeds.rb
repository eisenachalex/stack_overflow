50.times do
  question = Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
  title = (Faker::Company.catch_phrase) + "?"
  Question.create(user_id:rand(1..100), q_content:question, q_title:title, votes:rand(1..500))
end
