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
                    if v:get_id() ~= 2 then
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
    loc_vars = function(self, info_queue, back)
        return { vars = { localize { type = 'name_text', key = 'tag_negative', set = 'Tag' },self.config.joker_slot } }
    end,
    calculate = function(self, back, context)
        if context.end_of_round and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag(Tag('tag_negative'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
        end
    end,
}