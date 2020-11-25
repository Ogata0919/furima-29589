## Users Table

|Column|Type|Options|
|------|----|-------|
|user_name|string|null:false|
|email |string|unique:true|
|pasward|string|null:false|
|first_name|string|
|last_name|string|
|first_katakana|string|
|last_katakana|string|
|birthday|date|

### Association
- has_many : products
- has_many :purchase

## products Table

|Column|Type|Options|
|------|----|-------|
|exit_imagery|string|
|product_name|string|
|category|string|null:false|
|product_explanation|null:false|
|about_delivery|string|null:false|
|price|integer|null:false|

### Association
- belongs_to : users
- has_one : purchaser

## Address Table

|Column|Type|Options|
|------|----|-------|
|mail_number|integer|null:false|
|prefectures|string|null:false|
|ichiku_machi|string|null:false|
|numbering|integer|null:false|
|building_name|string|
|telephone_number|integer|null:false|
|purchase_id|references|null: false, foreign_key: true|

### Association
- belongs_to : purchase

## Purchase Table

|Column|Type|Options|
|------|----|-------|
|product_name|string|null:false|
|products_id|references|null: false, foreign_key: true|
|users_id|references|null: false, foreign_key: true|


### Association
- belongs_to : products
- belongs_to : users
- has_one : address