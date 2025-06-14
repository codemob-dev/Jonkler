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

NFS.load(Jonkler.path .. 'data/decks/minimalistic.lua')()
