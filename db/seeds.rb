10.times do
  user = User.create(email: Faker::Internet.email, password: "password",
                     password_confirmation: "password",
                     date_of_birth: Time.gm(rand(1950..2000),rand(1..12),rand(1..28)))
  5.times do
    question = Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
    title = (Faker::Company.catch_phrase) + "?"
    question_answer = Question.create(user_id: user.id, q_content: question, q_title: title, votes: rand(1..500))
    2.times do
      tag_name = Faker::Company.bs
      tag_names = tag_name.scan(/(\w+)/)
      tag_names.each do |tag|
        question_answer.tags << Tag.where(t_content: tag[0]).first_or_create
      end
    end
    5.times do
      answer = Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
      Answer.create(question_id: question_answer.id, user_id: user.id, a_content: answer, votes: rand(1..3000))
    end
  end
end
