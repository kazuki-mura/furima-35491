
## users テーブル
| Column             | Type       | Options           |
| ------------------ | ------     | -----------       |
| nickname           | string     | null: false       | 
| email              | string     | foreign_key: true |
| encrypted_password | string     | null: false       |
| last_name          | string     | null: false       |
| first_name         | string     | null: false       |
| last_name_kana     | string     | null: false       |
| first_name_kana    | string     | null: false       |
| birth_date         | date       | null: false       |

### Association
- has_many :items
- has_many :pay_forms


## items テーブル
| Column                 | Type    | Options     |
| ------------------     | ------  | ----------- |
| name                   | string  | null: false |
| info                   | text    | null: false |
| category_id            | integer | null: false |
| sales_status_id        | integer | null: false |
| price                  | integer | null: false |

### Association
- belongs_to :user
- has_one :purchase_record
- belongs_to :pay_form



## purchase_record テーブル
| Column                 | Type    | Options     |
| ------------------     | ------  | ----------- |
| shipping_fee_status_id | integer | null: false |
| prefecture_id          | integer | null: false |
| scheduled_delivery_id  | integer | null: false |

### Association
- belongs_to :item



## pay_forms テーブル
| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| postal_code        | integer  | null: false |
| prefecture         | string   | null: false |
| city               | text     | null: false |
| addresses          | text     | null: false |
| building           | string   | null: false |
| phone_number       | integer  | null: false |

### Association
- belongs_to :user
- has_many :purchase_record











<!-- | number             | integer  | null: false |
| exp_month          | integer  | null: false |
| exp_year           | integer  | null: false |
| cvc                | integer  | null: false | -->

<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
