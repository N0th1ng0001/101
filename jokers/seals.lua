SMODS.Atlas {
    key = "amoeba",
    path = "amoeba_seal.png",
    px=71,
    py=95
}
SMODS.Seal {
    key = "amoeba",
    atlas = "amoeba",
    badge_colour = G.C.RED,
    pos = {x=0,y=0},
    config = {extra={cards=1,odds=4}},

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds, 'amoeba')
        return { vars = { card.ability.seal.extra.cards,numerator,denominator } }
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card,'amoeba', 1, card.ability.seal.extra.odds) then    
                for i = 1, card.ability.seal.extra.cards do
                    SMODS.copy_card(card, { area = G.hand })
                end
            end
        end
    end
}