SMODS.Joker {
    key = "jon_nuclear_joker",
    name = "jon_Nuclear_Joker",
    atlas = 'jon_jokers',
    pos = {
        x = 8,
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
            odds = 4,
        },
    },
    loc_txt = {
        name = "Nuclear Joker",
        text = {
            "{C:green}#1# in #2#{} chance to",
            "destroy each played card.",
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}
        }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play then
            return {
                remove = pseudorandom('nuclear_joker') < G.GAME.probabilities.normal / card.ability.extra.odds,
            }
		end
    end
}