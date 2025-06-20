SMODS.Joker {
    key = "jon_cardless_joker",
    name = "jon_Cardless_Joker",
    atlas = 'jon_jokers',
    pos = {
        x = 3,
        y = 0,
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 5,
            odds = 2,
        },
    },
    loc_txt = {
        name = "Cardless Joker",
        text = {
            "{C:green}#1# in #2#{} chance to",
            "debuff each played card.",
            "Earn {C:mult}+#3#{} mult per trigger",
            "of a debuffed card."
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            for _, other_card in ipairs(G.play.cards) do
                if pseudorandom('cardless_joker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    SMODS.debuff_card(other_card, true, "cardless_joker")
                end
            end
        elseif context.end_of_round and context.individual then
            for _, other_card in ipairs(G.deck.cards) do
                SMODS.debuff_card(other_card, false, "cardless_joker")
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for _, other_card in ipairs(G.deck.cards) do
            SMODS.debuff_card(other_card, false, "cardless_joker")
        end
    end
}
function jon_handle_debuffed_card()
    for _, joker in ipairs(find_joker('jon_Cardless_Joker')) do
        SMODS.calculate_effect({mult = joker.ability.extra.mult}, joker)
    end
end
