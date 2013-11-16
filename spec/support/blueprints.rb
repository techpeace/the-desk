require 'faker'
require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Lesson.blueprint do
  body  { Faker::Lorem.paragraph(5) }
  title { Faker::Lorem.sentence.titleize }
end

Lesson.blueprint(:public) do
  is_public { true }
end

User.blueprint do
  email           { Faker::Internet.email }
  password        { "test1234" }
  password_confirmation { object.password }
  name            { Faker::Name.name }
end