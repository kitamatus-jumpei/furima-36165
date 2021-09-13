# README

＃テーブル設計

###usersテーブル 

| Column              | Type       | Options            |
| ------------------- | ---------- | ------------------ |
| email               | string     | unique: true       | ←重複したemailは保存できないようにするため
| encrypted_password  | string     | not null           |
| nickname            | string     | not null           |
| family_name         | string     | not null           |
| first_name          | string     | not null           |
| family_name_kana    | string     | not null           |
| first_name_kana     | string     | not null           |
| birthday            | string     | not null           |


### Association

- has_many :lists
- has_many :displays


###displaysテーブル

| Column       | Type               | Options            |
| -------------| ------------------ | ------------------ |
| title        | string             | not null           |
| explanation  | text               | not null           |
| category_id  | integer            | null: false        |
| condition_id | integer            | null: false        |  
| charge_id    | integer            | null: false        |
| area_id      | integer            | null: false        |
| days_id      | integer            | null: false        |
| price        | string             | not null           |
| image        | ActiveStorageで実装 |                    |
| user         | references         | null false,foreign_key: true |

### Association

- has_one :lists
- belong_to :user
<!-- １対多数 -->

###listsテーブル

| Column        | Type        | Options    |
|-------------- | ------------| ---------- |
| credit_card   | string      | not null   |
| month         | string      | not null   |
| year          | string      | not null   |
| security_code | string      | not null   |
| user          | references  | null false,foreign_key: true |
| display       | references  | null false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :display
- has_one    :shipping_address

<!-- 一対一 -->

###shipping_addressテーブル

| Column           | Type        | Options       |
|----------------- | ----------- | ------------- |
| postal_code_id   | string      | null: false   |←ActiveHashを用いての実装
| prefectures_id   | string      | null: false   |
| municipalities_id| string      | null: false   |
| address_id       | string      | null: false   |
| building_id      | string      | null: true    |
| telephone_id     | string      | null: false   |
| user             | references  | null false,foreign_key: true |
| display          | references  | null false,foreign_key: true |
| list             | references  | null false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :display
- belongs_to :list
<!-- 一対一 -->


<!-- ###commentsテーブル

| Column    | Type        | Options    |
|---------- | ------------| ---------- |
| text      | text        | not null   |
| user      | references  |            |
| display   | references  |            |

### Association

- belongs_to :user
- belongs_to :display
一対一 -->