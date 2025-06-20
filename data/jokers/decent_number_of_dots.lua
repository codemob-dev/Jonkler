SMODS.Joker {
    key = "jon_decent_number_of_dots",
    name = "jon_decent_number_of_dots",
    atlas = 'jon_jokers',
    pos = {
        x = 7,
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
            chips = 128,
        },
    },
    loc_txt = {
        name = "Approximately one hundred twenty-eight black pixels",
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