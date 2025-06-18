local old_can_sell_card = G.FUNCS.can_sell_card
local old_sell_card = G.FUNCS.sell_card
SMODS.Joker {
    key = "amish_joker",
    name = "jon_Amish_Joker",
    atlas = 'jon_jokers',
    pos = {
        x = 2,
        y = 0,
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 2,
        },
    },
    loc_txt = {
        name = "Amish Joker",
        text = {
            "{C:mult}+#1#{} mult for every card",
            "without a modifier played.",
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult}
        }
    end,
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.config.center == G.P_CENTERS.c_base then
				return {
					mult = card.ability.extra.mult,
					card = context.other_card
				}
			end
		end
	end
}