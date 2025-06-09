require 'csv'

# CSV読み込み
file_path = 'lib/japan_prefecture.csv'
csv_data = CSV.read(file_path)

# 都道府県データ抽出
prefectures_list = csv_data.map { |row| row[1] }.uniq

# 市区町村データ抽出
cities_list = csv_data.map do |row|
    next if row[2] == nil
    row[1, 2]
  end.compact

# 都道府県データ作成
prefectures_list.each do |prefecture|
  Prefecture.create!(name: prefecture)
end

# 市区町村データ作成
cities_list.each do |prefecture, city|
  prefecture = Prefecture.find_by(name: prefecture)
  prefecture.cities.create(name: city)
end

