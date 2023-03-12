FactoryBot.define do
  factory :email do
    received {
      'Hi Bodil,\n' \
      'Thank you for applying at Tractive! Since we’re all about open communication and quick feedback, we thought we’d give you the good news right away - we’d like to proceed further with your application. \n' \
      'To do so, we need the following from you:\n' \
      'We would like to ask you to fill in our technology screening in order to give us a better overview of your programming skills. Please be honest with your self-evaluation!\n' \
      'Just so you know, we do not offer full remote working at Tractive. We believe in the power of doing things all together, in one place. However in addition to our flexible working hours, we also offer a hybrid 2:2 home office model (2 home office days / 2 office days) to ensure that you are spatially independent. Is commuting to Linz/Austria for at least 2 office days a week an option for you?\n' \
      'Here is the link to access your application and personal info. You can also get some exclusive insights into the application process at Tractive here.\n' \
      '\n' \
      'Looking forward to hearing from you soon! Have a great day!\n' \
      '\n' \
      'Best Regards,\n' \
      'Romana Haspelhuber'
    }
    description { 'Inform about completing application'}

    trait :tonality_business do
      tonality { 'business' }
    end

    trait :tonality_business_casual do
      tonality { 'business-casual' }
    end

    trait :tonality_business_casual do
      tonality { 'casual' }
    end

    trait :received_empty do
      received { nil }
    end

    trait :description_empty do
      description { nil }
    end

    trait :tonality_empty do
      tonality { nil }
    end

    factory :email_empty, traits: %i[received_empty description_empty tonality_empty]
  end
end
