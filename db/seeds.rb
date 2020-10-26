# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # 管理者ログインデータの作成
#   Admin.create!(
#     email: "admin@gmail.com",
#     password: "Suits_ec",
#   )

# #ジャンルデータの作成
# Genre.create!(
#   name: "ショートケーキ",
#   is_active: true
# )

# Genre.create!(
#   name: "チョコレートケーキ",
#   is_active: true
# )

# Genre.create!(
#   name: "紫芋ケーキ",
#   is_active: false
# )

# 20.times do |number|
#   Product.create!(
#     name: number,
#     explanation: "説明",
#     genre_id: 1,
#     after_tax_price: 1000,
#     is_sale: true,
#     image_id: "1"
#   )
# end

# 20.times do |customer|
#   Customer.create!(
#     last_name: "acount",
#     first_name: "1",
#     last_name_kana: "イチ",
#     first_name_kana: "アカウント",
#     postcode: "0000000",
#     address: "豊島区",
#     phone_number: "0399999999",
#     email: "acount-#{SecureRandom.base64(10)}@gmail.com",
#     password: "acount-#{customer + 1}",
#     is_deleted: false
#   )
# end

# Order.create!(
#   customer_id: 1,
#   total_price: 6300,
#   name: "小松 真也",
#   postcode: "1234567",
#   address: "ハワイ島",
#   pay_method: 0,
#   order_status: 0,
#   postage: 800
# )

# OrderProduct.create!(
#   order_id: 1,
#   product_id: 1,
#   number: 2,
#   production_status: 0,
#   tax_price: 1100
# )

# OrderProduct.create!(
#   order_id: 1,
#   product_id: 2,
#   number: 3,
#   production_status: 0,
#   tax_price: 1100
# )

# Order.create!(
#   customer_id: 2,
#   total_price: 10900,
#   name: "マツコ",
#   postcode: "1234567",
#   address: "グアム島",
#   pay_method: 1,
#   order_status: 0,
#   postage: 800
# )

# OrderProduct.create!(
#   order_id: 2,
#   product_id: 3,
#   number: 2,
#   production_status: 0,
#   tax_price: 1100
# )

# OrderProduct.create!(
#   order_id: 2,
#   product_id: 4,
#   number: 3,
#   production_status: 0,
#   tax_price: 1100
# )

# OrderProduct.create!(
#   order_id: 2,
#   product_id: 6,
#   number: 4,
#   production_status: 0,
#   tax_price: 1100
# )