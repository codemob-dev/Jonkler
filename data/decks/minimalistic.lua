SMODS.Back {
    key = 'minimalistic',
    unlocked = true,
    atlas = 'jon_decks',
    loc_txt = {
        name = "Minimalistic Deck",
        text = {"Removes {C:attention}half{} of your cards",
                "at random.",
                "Your deck is reshuffled",
                "after running out of cards.",
        }
    },
    pos = {
        x = 0,
        y = 0,
    },
    config = {},

    apply = function(self)
        G.GAME.starting_params.minimalistic = true
    end,
}