
# 下にジュークボックスが無かったら自分をkill
execute \
unless block ~ ~-1 ~ jukebox run \
kill @s

# 何も入ってなかったらairに
execute \
unless data block ~ ~-1 ~ RecordItem.id run \
data modify entity @s item.id set value "minecraft:air"

# dataを適用
data modify entity @s item.id set from block ~ ~-1 ~ RecordItem.id

# 俺は回るぞ！
execute \
if data block ~ ~-1 ~ ticks_since_song_started \
if data block ~ ~-1 ~ RecordItem.id run \
tp @s ~ ~ ~ ~2 ~