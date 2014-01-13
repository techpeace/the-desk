class LessonUpdate < ActiveInteraction::Base
  model :lesson
  hash  :params do
    string :title
    string :body
  end

  def execute
    if lesson.update params
      lesson
    else
      errors.add lesson.errors
    end
  end
end