
## Users テーブル
| Column             | Type   | Options                   |
| -------------------|--------|---------------------------|
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :diaries



## Diaries テーブル
| Column     | Type       | Options                        |
| -----------|------------|--------------------------------|
| diary_date | date       | null: false                    |
| title      | string     | null: false                    |
| text       | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
