function ragnarok_level_up_hand(card, hand, level)
    level = level or 1
    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(hand, 'poker_hands'),chips = G.GAME.hands[hand].chips, mult = G.GAME.hands[hand].mult, level=G.GAME.hands[hand].level})
    level_up_hand(used_tarot, hand, nil, level)
    update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
end
SMODS.Joker {
    key = "jon_ragnarok",
    name = "jon_Ragnarok",
    atlas = 'jon_jokers',
    pos = {
        x = 9,
        y = 0,
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {},
    },
    loc_txt = {
        name = "Ragnarok",
        text = {
            "Levels down a random poker hand,",
            "then levels up your",
            "most played hand",
            "each round."
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            local most_played_hand, _tally = nil, 0
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    most_played_hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            local options = {}
            for _, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].level > 1 and v ~= most_played_hand then
                    table.insert(options, v)
                end
            end
            if #options == 0 then
                return {}
            end
        
            local hand = pseudorandom_element(options, pseudoseed('ragnarok_joker'))
            ragnarok_level_up_hand(card, most_played_hand, 1)
            ragnarok_level_up_hand(card, hand, -1)
		end
    end
}