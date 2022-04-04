# アプリケーション名
RealMeDiary

# アプリケーション概要
日記型SNS。ユーザーの日常の出来事・感情を知ることによって、ユーザー同士のより深い相互理解を促す。

# URL
https://real-me-diary.herokuapp.com/

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1r8MrsteqoSO0UMeNvA7wgTqUBIUbTld09I_NURJrco4/edit#gid=982722306

# アプリケーションを作成した背景
近年ではSNSが普及しているが、何かを発信するという行為が、「誰かに見てもらうこと」や「理想の自分として振る舞うこと」が前提であることが多いと感じた。
現代では特に「『ありのままの』自分」に価値が見出されているように感じるが、素の自分や自分の持っている価値観を誰かに知ってもらう機会（SNS）が少ないように思えた。
そこで、その日あった出来事を自分の感情とともに吐き出せる日記を、ユーザーと共有できるSNSがあれば、より深く自分を理解してもらえる場になるのではないかと考え、今回のアプリケーション作成に至った。

# 工夫したポイント


# テスト用アカウント
# 利用方法
# 実装した機能についての画像やGIFおよびその説明
# 実装予定の機能
# データベース設計
# 画面遷移図
# 開発環境
# ローカルでの動作方法





















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
