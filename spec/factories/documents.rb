FactoryBot.define do
  factory :document do
    after(:build) do |document|
      document.attachment.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'gilead.png')), filename: 'gilead.png', content_type: 'image/png')
    end

    title { "Vidéo" }
    language { "FR" }
    usage { "" }
    validation_at { "" }
    # validation_at { "2020-12-21 11:47:15" }
    format { "" }
  end
end
