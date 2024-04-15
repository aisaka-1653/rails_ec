# frozen_string_literal: true

namespace :promotion_code do
  desc 'プロモーションコードを10個生成する'
  task generate: :environment do
    10.times do |_n|
      PromotionCode.create!(
        code: SecureRandom.alphanumeric(7),
        amount: rand(100..1000)
      )
    end
  rescue ActiveRecord::RecordInvalid => e
    puts e
  end
end
