--- STEAMODDED HEADER
--- MOD_NAME: Jonkler
--- MOD_ID: Jonkler
--- MOD_DESCRIPTION: The Jonkler is real.
--- MOD_AUTHOR: [Codemob]
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 0.1

Jonkler = SMODS.current_mod

jon = {}

SMODS.Atlas {
	key = 'jon_decks',
	path = "decks.png",
	px = 71,
	py = 95,
}

SMODS.Atlas {
	key = 'jon_jokers',
	path = "jokers.png",
	px = 71,
	py = 95,
}

NFS.load(Jonkler.path .. 'data/decks/minimalistic.lua')()
-- scrapped
-- NFS.load(Jonkler.path .. 'data/jokers/jkr.lua')()
NFS.load(Jonkler.path .. 'data/jokers/hoarder.lua')()
NFS.load(Jonkler.path .. 'data/jokers/amish_joker.lua')()
NFS.load(Jonkler.path .. 'data/jokers/cardless_joker.lua')()
NFS.load(Jonkler.path .. 'data/jokers/jokerless_card.lua')()
NFS.load(Jonkler.path .. 'data/jokers/round_joker.lua')()
NFS.load(Jonkler.path .. 'data/jokers/a_lot_of_dots.lua')()
NFS.load(Jonkler.path .. 'data/jokers/decent_number_of_dots.lua')()
NFS.load(Jonkler.path .. 'data/jokers/nuclear_joker.lua')()
NFS.load(Jonkler.path .. 'data/jokers/ragnarok.lua')()
