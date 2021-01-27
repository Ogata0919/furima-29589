## Users Table

|Column|Type|Options|
|------|----|-------|
|user_name|string|null:false|
|email |string|unique:true|
|encrypted_password|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_katakana|string|null:false|
|last_katakana|string|null:false|
|birthday|date|null:false|

### Association
- has_many : product
- has_many :purchase

## products Table

|Column|Type|Options|
|------|----|-------|
|product_name|string|null:false|
|product_explanation|text|null:false|
|category_id|integer|null:false|
|commodity_id|integer|null:false|
|burden_delivery_id|integer|null:false|
|event_region_id|integer|null:false|
|dispatch_nichiji_id|integer|null:false|
|price|integer|null:false|

### Association
- belongs_to : user
- has_one : purchase

## Address Table

|Column|Type|Options|
|------|----|-------|
|mail_number|string|null:false|
|prefectures_id|string|null:false|
|ichiku_machi|string|null:false|
|numbering|integer|null:false|
|building_name|string|
|telephone_number|string|null:false|
|purchase|references|null: false, foreign_key: true|

### Association
- belongs_to : purchase

## Purchase Table

|Column|Type|Options|
|------|----|-------|
|products|references|null: false, foreign_key: true|
|users|references|null: false, foreign_key: true|


### Association
- belongs_to : product
- belongs_to : user
- has_one : address