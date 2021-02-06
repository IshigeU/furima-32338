# テーブル設計

## **users テーブル**

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| nickname              | string   | null: false |
| email                 | string   | null: false |
| password              | string   | null: false |
| encrypted_password    | string   | null: false |
| sei                   | string   | null: false |
| mei                   | string   | null: false |
| kana_sei              | string   | null: false |
| kana_mei              | string   | null: false |
| birthday              | date     | null: false |

# アソシエーション
has_many :items




## **items テーブル**

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| items_image       | string      | null: false                    |
| name              | string      | null: false                    |
| price             | integer     | null: false                    |
| discription       | string      | null: false                    |
| detailes          | string      | null: false                    |
| condition         | string      | null: false                    |
| delivery_cost     | string      | null: false                    |
| delivery_area     | string      | null: false                    |
| delivery_day      | string      | null: false                    |
| items_category    | string      | null: false                    |
| user_id           | integer     | null: false, foreign_key: true |

# アソシエーション
belongs_to :user



## **orderer_info テーブル**

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| post_code        | string       | null: false                    |
| prefectures      | string       | null: false                    |
| city             | string       | null: false                    |
| adress           | string       | null: false                    |
| building_name    | string       | null: false                    |
| phone_number     | string       | null: false                    |
| user_id          | integer      | null: false, foreign_key: true |

# アソシエーション
belongs_to :user



## **credit_card テーブル**

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          | integer      | null: false, foreign_key: true |
| card_id          | string       | null: false                    |
| security_code    | string       | null: false                    |

# アソシエーション
belongs_to :user