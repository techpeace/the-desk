# This is a set of rake tasks used to import data into the production server.
# Run `rake import:all` on the command line to import all available datasets,
# and `rake import:teks` to only import TEKS data.

require 'csv'

namespace :import do

  task all: [:teks] # add future tasks in here (CCRS, ELPS, etc.)

  task teks: :environment do
    dups, errors, count = {}, [], 0
    #this turns CSV into an array, skipping first line
    data = CSV.read('lib/assets/TEKS.csv', encoding: 'windows-1251:utf-8').to_a[1..-1]
    data.each_with_index do |line, index|
      (dups[line[0..3]] ||= []) << index
    end

    if dups.keep_if{ |k,v| v.size > 1 }.any?
      errors << "------ These IDs weren't unique:"
      dups.each{ |k,v| errors << "#{k.join ','} occurred on lines #{v.to_sentence}" }
      puts errors.join "\n" and exit!
    else
      standard_issuer = StandardsIssuer.where(name: 'TEKS').first_or_create
      data.each do |line|
        # find or create the subject, aka "Math" store that into a variable 'subject'
        subject = Subject.find_or_create_by(name: line[1])
        # find or create the course through the 'subject' variable, store that in 'course'
        course = subject.courses.find_or_create_by(name: line[2])
        # find or create the standard through the course and store that in variable 'standard'
        #     also, we have to assign standards_issuer_id to 'standard' variable defined on line 24
        standard = course.standards.where(standards_issuer_id: standard_issuer, grade: line[0],
                            key: line[3], text: line[4], keywords: line[5]
                           ).first_or_create

        standard.persisted? ? count += 1 : errors << "XXXX #{standard.attributes} failed with #{standard.errors.messages}"
      end
      puts "Added #{count} line-items for TEKS"
      if errors.any?
        puts "------ These records had errors:"
        puts errors.join "\n" and exit!
      end
    end
  end

end
