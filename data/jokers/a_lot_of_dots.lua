SMODS.Joker {
    key = "jon_a_lot_of_dots",
    name = "jon_a_lot_of_dots",
    atlas = 'jon_jokers',
    pos = {
        x = 6,
        y = 0,
    },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 6413,
        },
    },
    loc_txt = {
        name = "Six thousand four hundred thirteen black pixels",
        text = {
            "Gives {C:chips}+#1#{} chips.",
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.chips}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
		end
    end
}