SMODS.Atlas {
    key = "scribble",
    path = "Scribble_Enhancement.png",
    px=36,
    py=48
}
SMODS.Enhancement {
    key = 'scribble',
    atlas = "scribble",
    pos = { x = 0, y = 0 },
    config = {},
    calculate = function(self, card, context)
        local extra_chips = math.random(0, 50)
        if context.main_scoring and context.cardarea == G.play then
            return {chips = extra_chips} --{math.random(card.ability.extra.min, card.ability.extra.max)}
        end
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
