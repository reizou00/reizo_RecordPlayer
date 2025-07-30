
# レコード再生用のジュークボックスをSetBlock
setblock ~ ~ ~ jukebox

#> ディスプレイ系
    # レコード用のアイテムディスプレイを召喚(最初は透明)
    summon item_display ~ ~ ~ \
        {\
        item:\
            {\
            id:"minecraft:air"\
            },\
        Tags:\
            [\
            "reizo_rp.Record"\
            ],\
        transformation:\
            {\
            left_rotation:\
                [\
                0.7071068f,\
                0.0f,\
                0.0f,\
                0.7071068f\
                ],\
            right_rotation:\
                [\
                0.0f,\
                0.0f,\
                0.0f,\
                1.0f\
                ],\
            translation:\
                [\
                0.0f,\
                0.0f,\
                0.0f\
                ],\
            scale:\
                [\
                0.99999994f,\
                0.9999998f,\
                0.9999998f\
                ]\
            }\
        }

#> レコードを移動
    # dataゲット
    # X
    data modify storage reizo_rp:_ x set from block ~ ~ ~ x
        # Yだけ1上げる
        execute \
        store result score $y reizo_rp.Temp run \
        data get block ~ ~ ~ y
        scoreboard players add $y reizo_rp.Temp 1
        # 適応
        execute \
        store result storage reizo_rp:_ y int 1 run \
        scoreboard players get $y reizo_rp.Temp
    # Z
    data modify storage reizo_rp:_ z set from block ~ ~ ~ z
    # data適応
    execute \
    as @n[tag=reizo_rp.Record] at @s run \
    function reizo_rp:entity/record/tp with storage reizo_rp:_

execute \
positioned as @n[type=item_display,tag=reizo_rp.Record] \
positioned ~-0.03 ~-0.45 ~-0.0001 run \
function reizo_rp:bde_models/spreader/create