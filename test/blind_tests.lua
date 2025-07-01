-- See https://github.com/BakersDozenBagels/Balatest/ for more information.

Balatest.TestPlay {
    name = 'leader',
    category = { 'blinds', 'boss', 'leader' },

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
    category = { 'blinds', 'boss', 'leader' },

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
    category = { 'blinds', 'boss', 'attrition' },

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
    category = { 'blinds', 'boss', 'attrition' },

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
    category = { 'blinds', 'boss', 'solo' },

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
    category = { 'blinds', 'boss', 'solo' },

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
    category = { 'blinds', 'boss', 'solo' },

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
    category = { 'blinds', 'boss', 'solo' },

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
    category = { 'blinds', 'boss', 'witch' },

    hand_size = 100,
    blind = 'bl_Bakery_Qof',
    execute = function() end,
    assert = function()
        Balatest.assert_eq(#G.hand.cards, 53)
    end
}
Balatest.TestPlay {
    name = 'witch_chicot',
    category = { 'blinds', 'boss', 'witch' },

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
    category = { 'blinds', 'boss', 'build' },

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
    category = { 'blinds', 'boss', 'build' },

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
    category = { 'blinds', 'boss', 'ruler' },

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
    category = { 'blinds', 'boss', 'ruler' },

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

if next(SMODS.find_mod "MoreFluff") and SMODS.Mods["MoreFluff"].config and SMODS.Mods["MoreFluff"].config["Superboss"] then
    -- DX Boss Blinds tests
    Balatest.TestPlay {
        name = 'leader_dx',
        category = { 'blinds', 'dx', 'leader' },

        hands = 5,
        discards = 5,
        blind = 'bl_Bakery_AlephDX',
        execute = function() end,
        assert = function()
            Balatest.assert_eq(G.GAME.current_round.hands_left, 3)
            Balatest.assert_eq(G.GAME.current_round.discards_left, 3)
        end
    }
    Balatest.TestPlay {
        name = 'leader_dx_chicot',
        category = { 'blinds', 'dx', 'leader' },

        jokers = { 'j_chicot' },
        hands = 5,
        discards = 5,
        blind = 'bl_Bakery_AlephDX',
        execute = function() end,
        assert = function()
            Balatest.assert_eq(G.GAME.current_round.hands_left, 5)
            Balatest.assert_eq(G.GAME.current_round.discards_left, 5)
        end
    }

    Balatest.TestPlay {
        name = 'attrition_dx',
        category = { 'blinds', 'dx', 'attrition' },

        blind = 'bl_Bakery_TsadiDX',
        execute = function()
            Balatest.play_hand { '2S' }
        end,
        assert = function()
            Balatest.assert_chips(-63)
        end
    }
    Balatest.TestPlay {
        name = 'attrition_dx_chicot',
        category = { 'blinds', 'dx', 'attrition' },

        jokers = { 'j_chicot' },
        blind = 'bl_Bakery_TsadiDX',
        execute = function()
            Balatest.play_hand { '2S' }
        end,
        assert = function()
            Balatest.assert_chips(7)
        end
    }

    Balatest.TestPlay {
        name = 'build_dx',
        category = { 'blinds', 'dx', 'build' },

        blind = 'bl_Bakery_KafDX',
        execute = function()
            Balatest.play_hand { '2S' }
        end,
        assert = function()
            Balatest.assert_chips(0)
        end
    }
    Balatest.TestPlay {
        name = 'build_dx_chicot',
        category = { 'blinds', 'dx', 'build' },

        blind = 'bl_Bakery_KafDX',
        jokers = { 'j_chicot' },
        execute = function()
            Balatest.play_hand { '2S' }
        end,
        assert = function()
            Balatest.assert_chips(7)
        end
    }

    Balatest.TestPlay {
        name = 'ruler_dx',
        category = { 'blinds', 'dx', 'ruler' },

        blind = 'bl_Bakery_SamekhDX',
        deck = { cards = {
            { r = 'A', s = 'H' },
            { r = 'K', s = 'H' },
            { r = 'Q', s = 'H' },
            { r = 'J', s = 'H' },
            { r = 'J', s = 'H' },
            { r = '2', s = 'S' }, -- Prevent game over from no cards
        } },
        execute = function()
            Balatest.play_hand { 'AH', 'KH', 'QH', 'JH', 'JH' }
        end,
        assert = function()
            Balatest.assert_chips(140)
        end
    }
    Balatest.TestPlay {
        name = 'ruler_dx_chicot',
        category = { 'blinds', 'dx', 'ruler' },

        blind = 'bl_Bakery_SamekhDX',
        jokers = { 'j_chicot' },
        deck = { cards = {
            { r = 'A', s = 'H' },
            { r = 'K', s = 'H' },
            { r = 'Q', s = 'H' },
            { r = 'J', s = 'H' },
            { r = 'J', s = 'H' },
            { r = '2', s = 'S' }, -- Prevent game over from no cards
        } },
        execute = function()
            Balatest.play_hand { 'AH', 'KH', 'QH', 'JH', 'JH' }
        end,
        assert = function()
            Balatest.assert_chips(344)
        end
    }
end
