SMODS.Atlas {
    key = "scribble",
    path = "Scribble_Enhancement.png",
    px=71,
    py=95
}
SMODS.Enhancement {
    key = 'scribble',
    atlas = "scribble",
    pos = { x = 0, y = 0 },
    config = { extra = {max = 50, min = 0}},
    loc_vars = function(self, info_queue, card)
        return { vars = {math.random(card.ability.extra.min, card.ability.extra.max)} }
    end,
}
-- -- Bonus
-- SMODS.Enhancement {
--     key = 'bonus',
--     pos = { x = 1, y = 1 },
--     config = { bonus = 30 },
--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.bonus } }
--     end,
-- }

-- -- Mult
-- SMODS.Enhancement {
--     key = 'mult',
--     pos = { x = 2, y = 1 },
--     config = { mult = 4 },
--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.mult } }
--     end,
-- }
