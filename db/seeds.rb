# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Adminログイン用
Admin.create!(
  email: 'test@test.com',
  password: 'testadmin'
  )

# User（会員情報）
user1 = User.create!(
  last_name: '山田', first_name: '太郎', nickname: 'タロ助', email: 'taro@example.com', password: 'yyyyyy', password_confirmation: 'yyyyyy',
  phone_number: '02012345678', gender: 'male', birth_date: '1995-09-16', introduction: '大学生になってから海外旅行に興味を持ち、数カ国旅行をしました！',
  )
user1.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image1.jpg')),filename: 'user-image1.jpg')

user2 = User.create!(
  last_name: '轟', first_name: '俊介', nickname: 'トド', email: 'todo@example.com', password: 'tototo', password_confirmation: 'tototo',
  phone_number: '02023456789', gender: 'male', birth_date: '2000-11-15', introduction: '国内旅行が多いです。今後は海外への旅行を増やしていきます！'
  )
user2.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image2.jpg')),filename: 'user-image2.jpg')

user3 = User.create!(
  last_name: 'ジャンク', first_name: 'キッド', nickname: 'ジャンク', email: 'kid@example.com', password: 'zzzzzz', password_confirmation: 'zzzzzz',
  phone_number: '02034567891', gender: 'no_answer', birth_date: '1970-05-20', introduction: 'Hello guys! Please see if you like.'
  )
user3.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image1.jpg')),filename: 'user-image1.jpg')

user4 = User.create!(
  last_name: '令和', first_name: '花子', nickname: 'hana', email: 'hana@example.com', password: 'reiwaera', password_confirmation: 'reiwaera',
  phone_number: '02045678912', gender: 'female', birth_date: '2005-10-03', introduction: '海外の美味しい料理を見つけることが趣味です。料理に関するレビューをメインに投稿しています。'
  )
user4.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image1.jpg')),filename: 'user-image1.jpg')

user5 = User.create!(
  last_name: 'John', first_name: 'Smith', nickname: 'John', email: 'john@example.com', password: 'jjoohhnn', password_confirmation: 'jjoohhnn',
  phone_number: '02056789123', gender: 'male', birth_date: '1990-12-25', introduction: '<Countries I’ve visited> United States, China, Japan, Cambodia'
  )
user5.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image2.jpg')),filename: 'user-image2.jpg')

user6 = User.create!(
  last_name: '佐藤', first_name: '達也', nickname: 'evirob', email: 'evirob@example.com', password: 'evirob', password_confirmation: 'evirob',
  phone_number: '02067891234', gender: 'male', birth_date: '1986-08-11', introduction: '世界遺産検定3級を取得。趣味：世界遺産めぐり'
  )
user6.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image2.jpg')),filename: 'user-image2.jpg')

user7 = User.create!(
  last_name: '佐藤', first_name: '達子', nickname: 'たっちゃん', email: 'sato@example.com', password: '123456789', password_confirmation: '123456789',
  phone_number: '02078912345', gender: 'female', birth_date: '1986-08-10', introduction: '閲覧専用アカウント'
  )
user7.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image1.jpg')),filename: 'user-image1.jpg')

user8 = User.create!(
  last_name: '退会', first_name: '専用', nickname: '退会用', email: 'taikai@example.com', password: 'taikai', password_confirmation: 'taikai',
  phone_number: '02089123456', gender: 'no_answer', birth_date: '1999-09-09', is_deleted: true, introduction: '退会専用アカウント'
  )
user8.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image2.jpg')),filename: 'user-image2.jpg')

user9 = User.create!(
  last_name: '江戸川', first_name: '次郎', nickname: 'edo', email: 'edo@example.com', password: 'edoedoedo', password_confirmation: 'edoedoedo',
  phone_number: '11122223333', gender: 'male', birth_date: '1960-11-11', introduction: '江戸の町から出たことありません。生粋の江戸っ子です。'
  )
user9.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image1.jpg')),filename: 'user-image1.jpg')

user10 = User.create!(
  last_name: 'テスト', first_name: 'ユーザー', nickname: 'testuser', email: 'testuser@example.com', password: 'testuser', password_confirmation: 'testuser',
  phone_number: '22233334444', gender: 'male', birth_date: '2001-01-01', introduction: 'テストユーザー'
  )
user10.user_image.attach(io: File.open(Rails.root.join('app/assets/images/user-image2.jpg')),filename: 'user-image2.jpg')

# 国名一覧
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

['オーストラリア', 'キリバス', 'クック諸島', 'サモア', 'ソロモン諸島', 'ツバル', 'トンガ', 'ナウル', 'ニウエ', 'ニュージーランド', 'バヌアツ', 'パプアニューギニア', 'パラオ', 'フィジー', 'マーシャル', 'ミクロネシア' ].each do |name|
  oceania.children.create(name: name)
end

['アルジェリア', 'アンゴラ', 'ウガンダ', 'エジプト', 'エスワティニ', 'エチオピア', 'エリトリア', 'ガーナ', 'カーボベルデ', 'ガボン', 'カメルーン', 'ガンビア', 'ギニア', 'ギニアビサウ', 'ケニア', 'コートジボワール', 'コモロ','コンゴ共和国', 'コンゴ民主共和国', 'サントメ・プリンシペ', 'ザンビア', 'シエラレオネ', 'ジブチ', 'ジンバブエ', 'スーダン', 'セーシェル', '赤道ギニア', 'セネガル', 'ソマリア', 'タンザニア', 'チャド', '中央アフリカ', 'チュニジア', 'トーゴ', 'ナイジェリア', 'ナミビア', 'ニジェール', 'ブルキナファソ', 'ブルンジ', 'ベナン', 'ボツワナ', 'マダガスカル', 'マラウイ', 'マリ', '南アフリカ', '南スーダン', 'モザンビーク', 'モーリシャス', 'モーリタニア', 'モロッコ', 'リビア', 'リベリア', 'ルワンダ', 'レソト' ].each do |name|
  africa.children.create(name: name)
end

['アフガニスタン', 'アラブ首長国連邦', 'イエメン', 'イスラエル', 'イラク', 'イラン', 'オマーン', 'カタール', 'クウェート', 'サウジアラビア', 'シリア', 'トルコ', 'バーレーン', 'ヨルダン', 'レバノン' ].each do |name|
  middle_east.children.create(name: name)
end
