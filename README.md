# テーブル設計

## **users テーブル**

| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| nickname              | string   | null: false               |
| email                 | string   | null: false, unique: true |
| encrypted_password    | string   | null: false               |
| sei                   | string   | null: false               |
| mei                   | string   | null: false               |
| kana_sei              | string   | null: false               |
| kana_mei              | string   | null: false               |
| birthday              | date     | null: false               |

# アソシエーション
has_many :items
has_many :purchase_histories



## **items テーブル**

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| name              | string      | null: false                    |
| price             | integer     | null: false                    |
| description       | text        | null: false                    |
| condition_id      | integer     | null: false                    |
| delivery_cost_id  | integer     | null: false                    |
| prefecture_id     | integer     | null: false                    |
| delivery_day_id   | integer     | null: false                    |
| items_category_id | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
has_one: purchase_history



## **orderer_info テーブル**

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| post_code           | string       | null: false                    |
| prefecture_id       | integer      | null: false                    |
| city                | string       | null: false                    |
| address             | string       | null: false                    |
| building_name       | string       |                                |
| phone_number        | string       | null: false                    |
| purchase_history    | references   | null: false, foreign_key: true |

# アソシエーション
belongs_to :purchase_history 



## **purchase_history テーブル**

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user             | references   | null: false, foreign_key: true |
| item             | references   | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
belongs_to :item
has_one :orderer_info