SMODS.Atlas{
    key = "2_deck",
    path = "2_deck.png",
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