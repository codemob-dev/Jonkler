SMODS.Joker {
    key = "jon_round_joker",
    name = "jon_Round_Joker",
    atlas = 'jon_jokers',
    pos = {
        x = 5,
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
        extra = {
            mult = 5,
        },
    },
    loc_txt = {
        name = "Round Joker",
        text = {
            "Gives {C:mult}+#1#{} mult for each",
            "played 2, 5, or 10.",
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
			if id == 2 or id == 5 or id == 10 then
				return {
					mult = card.ability.extra.mult,
					card = context.other_card
				}
			end
		end
    end
}