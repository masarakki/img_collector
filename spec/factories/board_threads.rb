FactoryGirl.define do
  factory :board_thread do
    sequence(:title) { |n| "thread_title_#{n}" }
    hostname 'kilauea.bbspink.com'
    board_key 'megami'
    sequence(:thread_key) { |n| n + 1330282190 }
    dat_size 0
    res_num 0
    new_res 0
    accessed_at nil
    finished false
  end
end
