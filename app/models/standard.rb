class Standard < ActiveRecord::Base
  belongs_to :subject
  belongs_to :standard_course
  belongs_to :standards_issuer

  # Respect the order in which standards were imported.
  default_scope ->{ order('id ASC') }

  # Indicate whether or not this standard is a substandard of another parent standard.
  # TODO: Only works with TEKS, at the moment.
  def substandard?
    key.include? '.'
  end
end
