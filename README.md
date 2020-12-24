# DB設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| birthday           | date                | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |

### Association

* has_many :items
* has_many :purchase

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| category                            | string     | null: false       |
| state                               | text       | null: false       |
| user                                | references | foreign_key: true |
| prefecture_id                       | integer    | null: false       |
| delivery_date                       | string     | null: false       |
| price                               | integer    | null: false       |
| area                                | string     | null: false       |


### Association

- belongs_to :user
- has_one :purchase

## purchase table

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| items                     | references | foreign_key: true |
| users                     | references | foreign_key: true |

### Association

- has_one :delivery_destination
- belongs_to :user
- belongs_to :items

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