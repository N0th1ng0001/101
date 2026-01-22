 
-- you can have shared helper functions
function shakecard(self) --visually shake a card
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

function return_JokerValues() -- not used, just here to demonstrate how you could return values from a joker
    if context.joker_main and context.cardarea == G.jokers then
        return {
            chips = card.ability.extra.chips,       -- these are the 3 possible scoring effects any joker can return.
            mult = card.ability.extra.mult,         -- adds mult (+)
            x_mult = card.ability.extra.x_mult,     -- multiplies existing mult (*)
            card = self,                            -- under which card to show the message
            colour = G.C.CHIPS,                     -- colour of the message, Balatro has some predefined colours, (Balatro/globals.lua)
            message = localize('k_upgrade_ex'),     -- this is the message that will be shown under the card when it triggers.
            extra = { focus = self, message = localize('k_upgrade_ex') }, -- another way to show messages, not sure what's the difference.
        }
    end
end

SMODS.Atlas({
    key = "sample_wee",
    path = "j_sample_wee.png",
    px = 36,
    py = 48
})

SMODS.Atlas({
    key = "unefficient_joker",
    path = "pixil-frame-0.png",
    px = 36,
    py = 48
})
SMODS.Atlas({
    key = "lucky_joker",
    path = "lucky_joker.png ",
    px = 36,
    py = 48
})
SMODS.Atlas({
    key = "Nuclear_Joker",
    path = "Nuclear_Joker.png",
    px = 71,
    py = 95
})
SMODS.Joker{
    key = "sample_wee",                                  --name used by the joker.    
    config = { extra = { chips = 1, chip_mod = 2 } },    --variables used for abilities and effects.
    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
    rarity = 3,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
    cost = 10,                                            --cost to buy the joker in shops.
    blueprint_compat=true,                               --does joker work with blueprint.
    eternal_compat=true,                                 --can joker be eternal.
    unlocked = true,                                     --is joker unlocked by default.
    discovered = true,                                   --is joker discovered by default.    
    effect=nil,                                          --you can specify an effect here eg. 'Mult'
    soul_pos=nil,                                        --pos of a soul sprite.
    atlas = 'sample_wee',                                --atlas name, single sprites are deprecated.

    calculate = function(self,card,context)              --define calculate functions here
        if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards 
                if context.other_card:get_id() == 2 then -- played card is a 2 by rank
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips -- add configurable amount of chips to joker
                        return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
                            extra = {focus = card, message = localize('k_upgrade_ex')},
                            card = card,
                            colour = G.C.CHIPS
                        }
                end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
                chips = card.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
    end
}


SMODS.Joker{
    key = "unefficient_joker",
    config = { extra = { x_mult = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'unefficient_joker',

calculate = function(self, card, context)
    if context.joker_main and context.full_hand and context.scoring_hand then
        local uncounted = #context.full_hand - #context.scoring_hand
        if uncounted > 0 then
            return {
                x_mult = card.ability.extra.x_mult ^ uncounted,
                card = card
            }
        end
    end
end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult }, key = self.key }
    end
}
SMODS.Joker{
    key = "lucky_joker",
    config = {extra = {odds = 10, x_mult = 10}},
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "lucky_joker",

    loc_vars = function(self, info_queue, card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'lucky_joker')    
            return { vars = { card.ability.extra.x_mult,numerator, denominator }}
    end,
    calculate = function(self, card,context)
    --     loc_vars = function(self, info_queue, card)
    --     local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'vremade_8ball')
    --     return { vars = { numerator, denominator } }
    -- end,
        
        if context.individual and context.cardarea  == G.play then
            card.ability.extra.odds = 10 
            if G.GAME.current_round.hands_left == 0 then
                if card.ability.extra.odds > 1 then
                    card.ability.extra.odds = card.ability.extra.odds - 5
                end
                if SMODS.pseudorandom_probability(card,'lucky_joker', 1, card.ability.extra.odds) then --SMODS.pseudorandom_probability(card, 'vremade_8ball', 1, card.ability.extra.odds) then
                    return {
                        x_mult = card.ability.extra.x_mult
                    }
                end
            elseif SMODS.pseudorandom_probability(card,'lucky_joker', 1, card.ability.extra.odds) then
                return {
                    x_mult = card.ability.extra.x_mult
                    }
                end
            end
        end

}
SMODS.Joker{
    key = "Nuclear_Joker",
    atlas = "Nuclear_Joker",
    config = {extra = {odds = 4, x_mult = 1, x_mult_plus = 0.25}},
    pos = {x=0,y=0},
    rarity = 3,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "Nuclear_Joker",

    loc_vars = function(self, info_queue, card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'Nuclear_Joker')    
            return { vars = { card.ability.extra.x_mult,numerator, denominator }}
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            local debuffed_jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then -- if joker is not itself 
                    debuffed_jokers[#debuffed_jokers+1] = G.jokers.cards[i] -- add all other jokers into a array
                end
            end
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_plus    
            local joker_to_debuff = #debuffed_jokers > 0 and pseudorandom_element(debuffed_jokers, pseudoseed('clean')) or nil
            if SMODS.pseudorandom_probability(card,'Nuclear_Joker', 1, card.ability.extra.odds) and not context.blueprint then
                if joker_to_debuff then
                    SMODS.debuff_card(joker_to_debuff, true, "Nuclear Joker")
                end
                return {
                    x_mult = card.ability.extra.x_mult
                    }
            else 
                return{
                    x_mult = card.ability.extra.x_mult
                }
                
            end
            SMODS.debuff_card(joker_to_debuff, false, "Nuclear Joker")
        end
    end
}