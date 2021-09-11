# README

＃テーブル設計

###usersテーブル 

| Column    | Type       | Options            |
| --------- | ---------- | ------------------ |
| email     | string     | not null           |
| password  | string     | not null           |
| nickname  | string     | not null           |
| name      | string     | not null           |
| name_kana | string     | not null           |
| position  | string     | not null           |

### Association

- has_many :comments
- has_many :displays


###displaysテーブル

| Column     | Type               | Options            |
| -----------| ------------------ | ------------------ |
| title      | text               | not null           |
| explanation| text               | not null           |
| category   | text               | not null           |
| condition  | string             | not null           |
| charge     | string             | not null           |
| area       | string             | not null           |
| days       | string             | not null           |
| price      | string             | not null           |
| image      | ActiveStorageで実装 |                    |
| user       | references         |                    |

### Association

- has_many :comments
- belong_to :users
<!-- １対多数 -->


###commentsテーブル

| Column    | Type        | Options    |
|---------- | ------------| ---------- |
| text      | text        | not null   |
| user      | references  |            |
| display   | references  |            |

### Association

- belongs_to :users
- belongs_to :prototypes
<!-- 一対一 -->