SMODS.Atlas{
    key = "2_deck",
    path = "2_deck.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = "many_deck",
    path = "many_deck.png", 
    px = 71,
    py = 95

}
SMODS.Atlas{
    key = "texas_deck",
    path = "Texas_Deck.png",
    px = 36,
    py = 48
}



SMODS.Back {
    key = "2_deck",
    pos = { x = 0, y = 0 },
    config = { jokers = { 'j_sj_sample_wee' } },
    unlocked = true,
    atlas = "2_deck",
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() ~= 2  and v:is_face() then
                        SMODS.change_base(v, nil, '2')
                    end
                end
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, back)
        return {vars = {localize{ type = "name_text", key = self.config.jokers, set = "Joker"},}}
    end
}

SMODS.Back {
    key = "many_deck",
    atlas = "many_deck",
    pos = {x=0,y=0},
    config = {joker_slot = -4},
    unlocked = true,
    used_this_shop = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { localize { type = 'name_text', key = 'tag_negative', set = 'Tag' },self.config.joker_slot } }
    end,
    calculate = function(self, back, context)
        if G.STATE ~= G.STATES.SHOP then
            used_this_shop = false
        end
        if G.STATE == G.STATES.SHOP and not used_this_shop then
            used_this_shop = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag({ key = 'tag_negative' })
                    return true
                end}))
            end
        end
}

SMODS.Back{
    key = "texas_deck",
    atlas = "texas_deck",
    pos = {x=0, y=0},
    config = {chips = 100,hand_size = -6 , divider = 8},
    unlocked = true,
    loc_vars = function(self, info_queue, back)
        return { vars = {self.config.hand_size, self.config.chips } }
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.main_eval then
            self.config.chips = self.config.chips + G.GAME.chips/self.config.divider
            
        end
        if context.initial_scoring_step then
            return {
                 chips = self.config.chips
            }
            
        end
    end

}                           