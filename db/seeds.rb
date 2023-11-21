# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  [
    {
      name: '嵐田和也',
      email: 'a.kazuya09@gmail.com',
      role: 'super_admin',
      password: 'arashida10'
    },
    {
      name: '管理者だよ',
      email: 'k.arashida@chiyoda-hold.com',
      role: 'admin',
      password: 'arashida10'
    },
    {
      name: 'ショップ管理者なる予定',
      email: 'dummy@aaa.com',
      role: 'shop_admin',
      password: 'arashida10'
    }
  ]
)
User.create!(
  [
    {
      name: 'ユーザだよん',
      email: 'dummy@bbb.com',
      password: 'arashida10'
    }
  ]
)
Shop.create!(
  [
    {
    official_name: '松嶋屋',
    kana_name: 'マツシマヤ',
    description: 'ショップの説明文が入ります。ショップの説明文が入ります。ショップの説明文が入ります。',
    primary_category: '1',
    secondary_category: '10',
    tel: '00000000000',
    fax: '11111111111',
    email: 'k.arashida@chiyoda-hold.com',
    address: '山形県米沢市1丁目',
    status: 'draft'
  },
  {
    official_name: 'ショップA',
    kana_name: 'ショップエー',
    description: 'ダミーショップAの説明文です。',
    primary_category: '2',
    secondary_category: '20',
    tel: '00000000000',
    fax: '11111111111',
    email: 'shop_a@example.com',
    address: '山形県米沢市a丁目',
    status: 'draft'
  },
  {
    official_name: 'ショップB',
    kana_name: 'ショップビー',
    description: 'ダミーショップBの説明文です。',
    primary_category: '3',
    secondary_category: '30',
    tel: '00000000000',
    fax: '11111111111',
    email: 'shop_b@example.com',
    address: '山形県米沢市b丁目',
    status: 'draft'
  },
  {
    official_name: 'ショップC',
    kana_name: 'ショップシー',
    description: 'ダミーショップCの説明文です。',
    primary_category: '4',
    secondary_category: '40',
    tel: '00000000000',
    fax: '11111111111',
    email: 'shop_c@example.com',
    address: '山形県米沢市c丁目',
    status: 'draft'
  }
]
)
ShopCategory.create!(
  [
    {
      name: '食べる・飲む',
      slug: 'foods',
      parent_id: ''
    },
    {
      name: '美容・健康',
      slug: 'beauty',
      parent_id: ''
    },
    {
      name: '買う',
      slug: 'buy',
      parent_id: ''
    },
    {
      name: '遊ぶ',
      slug: 'play',
      parent_id: ''
    },
    {
      name: 'その他',
      slug: 'other',
      parent_id: ''
    },
    {
      name: 'ラーメン',
      slug: 'ramen',
      parent_id: 1
    },
    {
      name: 'カフェ',
      slug: 'cafe',
      parent_id: 1
    },
    {
      name: '居酒屋・バー',
      slug: 'sake',
      parent_id: 1
    },
    {
      name: '和食',
      slug: 'japanese-meal',
      parent_id: 1
    },
    {
      name: '洋食',
      slug: 'western-meal',
      parent_id: 1
    },
    {
      name: '中華・韓国料理',
      slug: 'chinease-korean-meal',
      parent_id: 1
    },
    {
      name: 'ソウルフード',
      slug: 'soul-food',
      parent_id: 1
    },
    {
      name: '美容室',
      slug: 'beauty-salon',
      parent_id: 2
    },
    {
      name: '理容室',
      slug: 'barber-shop',
      parent_id: 2
    },
    {
      name: '風呂・スパ・サロン',
      slug: 'spa',
      parent_id: 2
    },
    {
      name: 'リラク・リフレッシュ',
      slug: 'relaxation',
      parent_id: 2
    },
    {
      name: 'ファッション',
      slug: 'relaxation',
      parent_id: 3
    },
    {
      name: '住まい・生活',
      slug: 'relaxation',
      parent_id: 3
    },
    {
      name: '食品・お酒',
      slug: 'foods',
      parent_id: 3
    },
    {
      name: 'スポーツ',
      slug: 'sports',
      parent_id: 4
    },
    {
      name: 'ギャラリー',
      slug: 'gallery',
      parent_id: 4
    },
    {
      name: '自然',
      slug: 'nature',
      parent_id: 4
    },
    {
      name: '宿泊',
      slug: 'stay',
      parent_id: 5
    },
    {
      name: 'スクール',
      slug: 'school',
      parent_id: 5
    }
  ]
)

Area.create!(
  [
    { name: "相生町", kana_name: "アイオイチョウ" },
    { name: "赤崩", kana_name: "アカクズレ" },
    { name: "赤芝町", kana_name: "アカシバマチ" },
    { name: "浅川", kana_name: "アサガワ" },
    { name: "梓川", kana_name: "アズサガワ" },
    { name: "吾妻町", kana_name: "アヅマチヨウ" },
    { name: "アルカディア", kana_name: "アルカディア" },
    { name: "泉町", kana_name: "イズミマチ" },
    { name: "板谷", kana_name: "イタヤ" },
    { name: "入田沢", kana_name: "イリタザワ" },
    { name: "駅前", kana_name: "エキマエ" },
    { name: "大小屋", kana_name: "オオゴヤ" },
    { name: "大沢", kana_name: "オオサワ" },
    { name: "太田町", kana_name: "オオタマチ" },
    { name: "大平", kana_name: "オオダイラ" },
    { name: "大町", kana_name: "オオマチ" },
    { name: "小野川町", kana_name: "オノガワマチ" },
    { name: "鍛冶町", kana_name: "カジマチ" },
    { name: "春日", kana_name: "カスガ" },
    { name: "金池", kana_name: "カネイケ" },
    { name: "上新田", kana_name: "カミニイダ" },
    { name: "川井", kana_name: "カワイ" },
    { name: "川井小路", kana_name: "カワイコウジ" },
    { name: "神原", kana_name: "カンバラ" },
    { name: "木場町", kana_name: "キバマチ" },
    { name: "木和田", kana_name: "キワダ" },
    { name: "口田沢", kana_name: "クチタザワ" },
    { name: "窪田町窪田", kana_name: "クボタマチクボタ" },
    { name: "窪田町小瀬", kana_name: "クボタマチコゼ" },
    { name: "窪田町東江股", kana_name: "クボタマチヒガシエマタ" },
    { name: "窪田町藤泉", kana_name: "クボタマチフジイズミ" },
    { name: "窪田町矢野目", kana_name: "クボタマチヤノメ" },
    { name: "御廟", kana_name: "ゴビョウ" },
    { name: "栄町", kana_name: "サカエマチ" },
    { name: "桜木町", kana_name: "サクラギチヨウ" },
    { name: "笹野", kana_name: "ササノ" },
    { name: "笹野本町", kana_name: "ササノホンチョウ" },
    { name: "笹野町", kana_name: "ササノマチ" },
    { name: "塩井町塩野", kana_name: "シオイマチシオノ" },
    { name: "塩井町宮井", kana_name: "シオイマチミヤイ" },
    { name: "塩野", kana_name: "シオノ" },
    { name: "信夫町", kana_name: "シノブマチ" },
    { name: "下小菅", kana_name: "シモコスゲ" },
    { name: "下新田", kana_name: "シモニイダ" },
    { name: "下花沢", kana_name: "シモハナザワ" },
    { name: "諸仏町", kana_name: "ショブツマチ" },
    { name: "城西", kana_name: "ジョウセイ" },
    { name: "城南", kana_name: "ジョウナン" },
    { name: "城北", kana_name: "ジョウホク" },
    { name: "杉の目町", kana_name: "スギノメマチ" },
    { name: "李山", kana_name: "スモモヤマ" },
    { name: "関", kana_name: "セキ" },
    { name: "関根", kana_name: "セキネ" },
    { name: "関町", kana_name: "セキマチ" },
    { name: "竹井", kana_name: "タケイ" },
    { name: "立町", kana_name: "タツマチ" },
    { name: "立石", kana_name: "タテイシ" },
    { name: "舘山", kana_name: "タテヤマ" },
    { name: "舘山矢子町", kana_name: "タテヤマヤゴマチ" },
    { name: "中央", kana_name: "チュウオウ" },
    { name: "綱木", kana_name: "ツナギ" },
    { name: "遠山町", kana_name: "トオヤママチ" },
    { name: "通町", kana_name: "トオリマチ" },
    { name: "徳町", kana_name: "トクマチ" },
    { name: "徳町北", kana_name: "トクマチキタ" },
    { name: "直江石堤", kana_name: "ナオエセキテイ" },
    { name: "直江町", kana_name: "ナオエチョウ" },
    { name: "中田町", kana_name: "ナカダマチ" },
    { name: "長手", kana_name: "ナガテ" },
    { name: "成島町", kana_name: "ナルシママチ" },
    { name: "西大通", kana_name: "ニシオオドオリ" },
    { name: "八幡原", kana_name: "ハチマンパラ" },
    { name: "花沢", kana_name: "ハナザワ" },
    { name: "花沢町", kana_name: "ハナザワチョウ" },
    { name: "万世町牛森", kana_name: "バンセイチョウウシモリ" },
    { name: "万世町片子", kana_name: "バンセイチョウカタコ" },
    { name: "万世町金谷", kana_name: "バンセイチョウカナヤ" },
    { name: "万世町刈安", kana_name: "バンセイチョウカリヤス" },
    { name: "万世町桑山", kana_name: "バンセイチョウクワヤマ" },
    { name: "万世町梓山", kana_name: "バンセイチョウズサヤマ" },
    { name: "万世町立沢", kana_name: "バンセイチョウタツザワ" },
    { name: "万世町堂森", kana_name: "バンセイチョウドウモリ" },
    { name: "東", kana_name: "ヒガシ" },
    { name: "東大通", kana_name: "ヒガシオオドオリ" },
    { name: "広幡町大沢", kana_name: "ヒロハタマチオオサワ" },
    { name: "広幡町沖仲", kana_name: "ヒロハタマチオキナカ" },
    { name: "広幡町小山田", kana_name: "ヒロハタマチオヤマダ" },
    { name: "広幡町上小菅", kana_name: "ヒロハタマチカミコスゲ" },
    { name: "広幡町京塚", kana_name: "ヒロハタマチキョウヅカ" },
    { name: "広幡町成島", kana_name: "ヒロハタマチナルシマ" },
    { name: "福田", kana_name: "フクダ" },
    { name: "福田町", kana_name: "フクダマチ" },
    { name: "古志田町", kana_name: "フルシダマチ" },
    { name: "吹屋敷", kana_name: "ブキヤシキ" },
    { name: "吹屋敷町", kana_name: "ブキヤシキマチ" },
    { name: "芳泉町", kana_name: "ホウセンマチ" },
    { name: "堀川町", kana_name: "ホリカワチョウ" },
    { name: "本町", kana_name: "ホンチョウ" },
    { name: "松が岬", kana_name: "マツガサキ" },
    { name: "丸の内", kana_name: "マルノウチ" },
    { name: "三沢", kana_name: "ミサワ" },
    { name: "南原石垣町", kana_name: "ミナミハライシガキマチ" },
    { name: "南原猪苗代町", kana_name: "ミナミハライナワシロマチ" },
    { name: "南原笹野町", kana_name: "ミナミハラササノマチ" },
    { name: "南原新町", kana_name: "ミナミハラシンマチ" },
    { name: "南原横堀町", kana_name: "ミナミハラヨコボリマチ" },
    { name: "門東町", kana_name: "モントウマチ" },
    { name: "簗沢", kana_name: "ヤナザワ" },
    { name: "矢来", kana_name: "ヤライ" },
    { name: "林泉寺", kana_name: "リンセンジ" },
    { name: "六郷町桐原", kana_name: "ロクゴウマチキリバラ" },
    { name: "六郷町轟", kana_name: "ロクゴウマチトドロキ" },
    { name: "六郷町長橋", kana_name: "ロクゴウマチナガハシ" },
    { name: "六郷町西江股", kana_name: "ロクゴウマチニシエマタ" },
    { name: "六郷町西藤泉", kana_name: "ロクゴウマチニシフジイズミ" },
    { name: "六郷町一漆", kana_name: "ロクゴウマチヒトツウルシ" }
  ]
)