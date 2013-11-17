require 'faker'
require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Comment.blueprint do
  message { Faker::Lorem.paragraph(5) }
end

Lesson.blueprint do
  body  { Faker::Lorem.paragraph(5) }
  title { Faker::Lorem.sentence.titleize }
end

Lesson.blueprint(:public) do
  is_public { true }
end

Lesson.blueprint(:public_private_mix) do
  # generate a public lesson 70% of the time
  # generate a private lesson 30% of the time
  is_public { rand(100) > 30 ? true : false }
end

User.blueprint do
  email           { Faker::Internet.email }
  password        { "test1234" }
  password_confirmation { object.password }
  name            { Faker::Name.name }
end
