-- scrapped

function get_vowel_indexes(str)
    local indexes = {}
    local pos = 0
    for c in str:gmatch(".") do
        pos = pos + 1
        if c:match("[AEIOUaeiou]") then
            table.insert(indexes, pos)
        end
    end
    return indexes
end

SMODS.Joker {
    key = "jkr",
    name = "Jkr",
    atlas = 'jon_jokers',
    pos = {
        x = 0,
        y = 0,
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        extra = 2,
    },
    loc_txt = {
        name = "Jkr",
        text = {"Removes {C:attention}all vowels{} from consumables.",
                "Earn {C:money}$#1#{} for each removed vowel.",
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra}
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            for _, consumable in ipairs(G.consumeables.cards) do 
                local text = consumable.config.center.name

                local indexes = get_vowel_indexes(text)
                if #indexes > 0 then
                    
                    for i = #indexes, 1, -1 do
                        local idx = indexes[i]
                        text = text:sub(1, idx - 1) .. consumable.ability.name:sub(idx + 1)
                    end

                    consumable.config.center.name = text

                    local money = card.ability.extra * #indexes
                    ease_dollars(money)
                    return {
                        message = localize('$')..money,
                        colour = G.C.MONEY,
                        card = card
                    }
                end

            end
        end
    end
}