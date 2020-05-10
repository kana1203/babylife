FactoryBot.define do

  factory :genre do  
    name              {"aaa"}
  end

  factory :post do
    title             {"test"}
    text              {"テスト"}
    image             { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/wp_pc.jpg')) }
  end

end