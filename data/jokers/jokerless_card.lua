SMODS.Joker {
    key = "jon_jokerless_card",
    name = "jon_Jokerless_Card",
    atlas = 'jon_jokers',
    pos = {
        x = 4,
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
            mult = 20,
        },
    },
    loc_txt = {
        name = "Jokerless Card",
        text = {
            "Debuff the joker to",
            "the right of this joker.",
            "{C:mult}+#1#{} mult for each",
            "debuffed joker.",
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local other_joker = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i+1] end
            end
            if other_joker then
                SMODS.debuff_card(other_joker, true, "jokerless_card")
            end
        elseif context.end_of_round and context.individual then
            for _, other_card in ipairs(G.jokers.cards) do
                SMODS.debuff_card(other_card, false, "jokerless_card")
            end
        elseif context.joker_main then
            local mult = 0
            for _, other_card in ipairs(G.jokers.cards) do
                if other_card.debuff then
                    mult = mult + card.ability.extra.mult
                end
            end
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for _, other_card in ipairs(G.jokers.cards) do
            SMODS.debuff_card(other_card, false, "jokerless_card")
        end
    end
}