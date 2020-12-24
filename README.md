# DB設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | unique: true, null: false |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| birthday           | date                | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |

### Association

* has_many :items
* has_many :purchases

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| category_id                         | integer    | null: false       |
| state_id                            | integer    | null: false       |
| user                                | references | foreign_key: true |
| prefecture_id                       | integer    | null: false       |
| delivery_date_id                    | integer    | null: false       |
| price                               | integer    | null: false       |
| area                                | string     | null: false       |
| delivery_charge                     | string     | null: false       |

### Association

- belongs_to :user
- has_one :purchase

## purchase table

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| item                      | references | foreign_key: true |
| user                      | references | foreign_key: true |

### Association

- has_one :delivery_destination
- belongs_to :user
- belongs_to :item

## delivery_destination table

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| postal_code               | string     | null: false       |
| prefecture_id             | integer    | null: false       |
| city                      | string     | null: false       |
| block                     | string     | null: false       |
| building_name             | string     |                   |
| phone_number              | string     | null: false       |
| purchase                  | references | foreign_key: true |

### Association

belongs_to :purchase