local old_can_sell_card = G.FUNCS.can_sell_card
local old_sell_card = G.FUNCS.sell_card
G.FUNCS.can_sell_card = function(card)
    if next(find_joker("jon_Hoarder")) then
        return false
    end
    return old_can_sell_card(card)
end
G.FUNCS.sell_card = function(card)
    if next(find_joker("jon_Hoarder")) then
        return
    end
    return old_sell_card(card)
end
SMODS.Joker {
    key = "hoarder",
    name = "jon_Hoarder",
    atlas = 'jon_jokers',
    pos = {
        x = 1,
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
            jokers = 2,
            consumables = 2,
        },
    },
    loc_txt = {
        name = "Hoarder",
        text = {"{C:attention}+#1#{} joker slots, {C:attention}+#2#{} consumable slot.",
                "Jokers and consumables cannot be sold.",
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.jokers, card.ability.extra.consumables}
        }
    end,
    add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit       = G.jokers.config.card_limit       + card.ability.extra.jokers
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumables
	end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit       = G.jokers.config.card_limit       - card.ability.extra.jokers
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.consumables
    end,
}