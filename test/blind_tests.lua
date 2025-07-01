-- See https://github.com/BakersDozenBagels/Balatest/ for more information.

Balatest.TestPlay {
    name = 'leader',
    category = { 'blinds', 'leader' },

    hands = 5,
    discards = 5,
    blind = 'bl_Bakery_Aleph',
    execute = function() end,
    assert = function()
        Balatest.assert_eq(G.GAME.current_round.hands_left, 4)
        Balatest.assert_eq(G.GAME.current_round.discards_left, 4)
    end
}
Balatest.TestPlay {
    name = 'leader_chicot',
    category = { 'blinds', 'leader' },

    jokers = { 'j_chicot' },
    hands = 5,
    discards = 5,
    blind = 'bl_Bakery_Aleph',
    execute = function() end,
    assert = function()
        Balatest.assert_eq(G.GAME.current_round.hands_left, 5)
        Balatest.assert_eq(G.GAME.current_round.discards_left, 5)
    end
}

Balatest.TestPlay {
    name = 'attrition',
    category = { 'blinds', 'attrition' },

    blind = 'bl_Bakery_Tsadi',
    execute = function()
        Balatest.play_hand { '2S' }
    end,
    assert = function()
        Balatest.assert_chips(-28)
    end
}
Balatest.TestPlay {
    name = 'attrition_chicot',
    category = { 'blinds', 'attrition' },

    jokers = { 'j_chicot' },
    blind = 'bl_Bakery_Tsadi',
    execute = function()
        Balatest.play_hand { '2S' }
    end,
    assert = function()
        Balatest.assert_chips(7)
    end
}

Balatest.TestPlay {
    name = 'solo_single',
    category = { 'blinds', 'solo' },

    blind = 'bl_Bakery_He',
    execute = function()
        Balatest.play_hand { '2S' }
    end,
    assert = function()
        Balatest.assert_chips(7)
    end
}
Balatest.TestPlay {
    name = 'solo_double',
    category = { 'blinds', 'solo' },

    blind = 'bl_Bakery_He',
    execute = function()
        Balatest.play_hand { '2S', '2H', '2C' }
    end,
    assert = function()
        Balatest.assert_chips(32 * 3)
    end
}
Balatest.TestPlay {
    name = 'solo_straight',
    category = { 'blinds', 'solo' },

    blind = 'bl_Bakery_He',
    execute = function()
        Balatest.play_hand { '2S', '3H', '6S', '4C', '5D' }
    end,
    assert = function()
        Balatest.assert_chips(36 * 4)
    end
}
Balatest.TestPlay {
    name = 'solo_chicot',
    category = { 'blinds', 'solo' },

    jokers = { 'j_chicot' },
    blind = 'bl_Bakery_He',
    execute = function()
        Balatest.play_hand { '2S', '2H', '2C' }
    end,
    assert = function()
        Balatest.assert_chips(36 * 3)
    end
}

Balatest.TestPlay {
    name = 'witch',
    category = { 'blinds', 'witch' },

    hand_size = 100,
    blind = 'bl_Bakery_Qof',
    execute = function() end,
    assert = function()
        Balatest.assert_eq(#G.hand.cards, 53)
    end
}
Balatest.TestPlay {
    name = 'witch_chicot',
    category = { 'blinds', 'witch' },

    hand_size = 100,
    jokers = { 'j_chicot' },
    blind = 'bl_Bakery_Qof',
    execute = function() end,
    assert = function()
        Balatest.assert_eq(#G.hand.cards, 52)
    end
}

Balatest.TestPlay {
    name = 'build',
    category = { 'blinds', 'build' },

    blind = 'bl_Bakery_Kaf',
    execute = function()
        Balatest.play_hand { '2S' }
    end,
    assert = function()
        Balatest.assert_chips(2)
    end
}
Balatest.TestPlay {
    name = 'build_chicot',
    category = { 'blinds', 'build' },

    blind = 'bl_Bakery_Kaf',
    jokers = { 'j_chicot' },
    execute = function()
        Balatest.play_hand { '2S' }
    end,
    assert = function()
        Balatest.assert_chips(7)
    end
}

Balatest.TestPlay {
    name = 'ruler',
    category = { 'blinds', 'ruler' },

    blind = 'bl_Bakery_Samekh',
    deck = { cards = {
        { r = '2', s = 'C', e = 'm_stone' },
        { r = '2', s = 'D', e = 'm_stone' }, -- Prevent game over from no cards
    } },
    execute = function()
        Balatest.play_hand { '2C' }
    end,
    assert = function()
        Balatest.assert_chips(5)
    end
}
Balatest.TestPlay {
    name = 'ruler_chicot',
    category = { 'blinds', 'ruler' },

    blind = 'bl_Bakery_Samekh',
    jokers = { 'j_chicot' },
    deck = { cards = {
        { r = '2', s = 'C', e = 'm_stone' },
        { r = '2', s = 'D', e = 'm_stone' }, -- Prevent game over from no cards
    } },
    execute = function()
        Balatest.play_hand { '2C' }
    end,
    assert = function()
        Balatest.assert_chips(55)
    end
}

-- TODO: Add test for The Stoic
