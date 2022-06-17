# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nation = Genre.create(name: '国名')
asia, europe, north_america, south_america, oceania, africa, middle_east = nation.children.create(
  [
    { name: 'アジア' },
    { name: 'ヨーロッパ' },
    { name: '北アメリカ' },
    { name: '南アメリカ' },
    { name: 'オセアニア' },
    { name: 'アフリカ' },
    { name: '中東' }
  ]
)

['インド', 'インドネシア', 'カンボジア', 'シンガポール', 'スリランカ', 'タイ', '韓国', '中国', 'ネパール', 'パキスタン', 'バングラデシュ', '東ティモール', '日本', 'フィリピン', 'ブータン', 'ブルネイ', 'ベトナム', 'マレーシア', 'ミャンマー', 'モルディブ', 'モンゴル', 'ラオス', '北朝鮮', '台湾', '香港', 'マカオ' ].each do |name|
  asia.children.create(name: name)
end

['アイスランド', 'アイルランド', 'アゼルバイジャン', 'アルバニア', 'アルメニア', 'アンドラ', 'イタリア', 'ウクライナ', 'ウズベキスタン', '英国', 'エストニア', 'オーストリア', 'オランダ', 'カザフスタン', '北マケドニア', 'キプロス', 'ギリシャ', 'キルギス', 'クロアチア', 'コソボ', 'サンマリノ', 'ジョージア', 'スイス', 'スウェーデン', 'スペイン', 'スロバキア', 'スロベニア', 'セルビア', 'タジキスタン', 'チェコ', 'デンマーク', 'ドイツ', 'トルクメニスタン', 'ノルウェー', 'バチカン', 'ハンガリー', 'フィンランド', 'フランス', 'ブルガリア', 'ベラルーシ', 'ベルギー', 'ポーランド', 'ボスニア・ヘルツェゴビナ', 'ポルトガル', 'マルタ', 'モナコ', 'モルドバ', 'モンテネグロ', 'ラトビア', 'リヒテンシュタイン', 'リトアニア', 'ルーマニア', 'ルクセンブルク', 'ロシア' ].each do |name|
  europe.children.create(name: name)
end

['米国', 'カナダ' ].each do |name|
  north_america.children.create(name: name)
end

['アルゼンチン', 'アンティグア・バーブーダ', 'ウルグアイ', 'エクアドル', 'エルサルバドル', 'ガイアナ', 'キューバ', 'グアテマラ', 'グレナダ', 'コスタリカ', 'コロンビア', 'ジャマイカ', 'スリナム', 'セントビンセントおよびグレナディーン諸島', 'セントクリストファー・ネービス', 'セントルシア', 'チリ', 'ドミニカ国', 'ドミニカ共和国', 'トリニダード・トバゴ', 'ニカラグア', 'ハイチ', 'パナマ', 'バハマ', 'パラグアイ', 'バルバドス', 'ブラジル', 'ベネズエラ', 'ベリーズ', 'ペルー', 'ボリビア', 'ホンジュラス', 'メキシコ' ].each do |name|
  south_america.children.create(name: name)
end

