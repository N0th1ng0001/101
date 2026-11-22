SMODS.Atlas({
    key = "deity",
    path = "deity_tarot.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "disease",
    path = "deity_tarot.png",
    px = 71,
    py = 95
})
SMODS.Atlas({
    key = "pencil",
    path = "deity_tarot.png",
    px = 71,
    py = 95
})
SMODS.Consumable {
    key = 'deity',
    set = 'Tarot',
    atlas = "deity",    
    pos = { x = 0, y = 0 },
    config = { extra = { spectrals = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tarots } }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.spectrals, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Spectral' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or
            (card.area == G.consumeables)
    end
}
SMODS.Consumable {
    key = 'disease',
    set = 'Tarot',
    atlas = "disease",
    pos = { x = 0, y = 0 },
    config = { extra = { seal = 'sj_amoeba' }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal(card.ability.extra.seal, nil, true)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}
SMODS.Consumable {
    key = 'pencil',
    set = 'Tarot',
    atlas = "pencil",    
    pos = { x = 0, y = 0 },
    config = { extra = { spectrals = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tarots } }
    end,
    use = function(self, card, area, copier)
        local aura_card = G.hand.highlighted[1]
        aura_card:set_edition(sj_scribble, true)
    end,
    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or
            (card.area == G.consumeables)
    end
}