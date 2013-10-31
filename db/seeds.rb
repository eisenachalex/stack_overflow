10.times do
  user = User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password", date_of_birth: Time.gm(rand(1950..2000),rand(1..12),rand(1..28)))
  5.times do
    question = Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
    title = (Faker::Company.catch_phrase) + "?"
    Question.create(user_id: user.id, q_content:question, q_title:title, votes:rand(1..500))
  end
end
