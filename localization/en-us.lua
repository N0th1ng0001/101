return {
    descriptions = {
        Joker = {
            j_sj_sample_wee = {
                name = "Exponential Wee",
                text = {
                    "This joker starts",
                    "with {C:chips} 1 chip,",
                    "when a 2 is played it doubles",
                    "the chips",
                    "{C:inactive} Currently {C:inactive} has {C:chips} #1# {C:chips} chips"
                },
            },
            j_sj_unefficient_joker = {
                name = "Unefficient Joker",
                text = {
                    {
                       "Each unscored card",
                        "gets {C:mult} 2X {C:mult} Mult",
                   }
                },
            },
            j_sj_lucky_joker = {
                name = "Lucky Joker",
                text = {
                    {
                        "{C:green}1 in 10{} chance", 
                        "to get {C:mult} 10X Mult{}",
                        "{C:green}1 in 5{} on",
                        "last hand of round"
                    }
                },
            },
            j_sj_Nuclear_Joker={
                name = "Nuclear Joker",
                text = {
                    {
                    "Whenever a hand is played, this joker gains x0.15 mult.",
                    "When a hand is played, {C:green}1/4{} chance to debuff a random joker. "
                }
            }
        }
    },
    Back = {
        b_sj_2_deck ={
            name = "2 Deck",
            text = {
                
                "Start a run with a deck of",
                "only 2s and a Exponential Wee"
                
            },
        },
        b_sj_many_deck = {
            name = "Many Deck",
            text = {
                "After every blind",
                "create a negative tag",
                "-4 joker slots"

            }
        }
    },
    Tarot = {
        c_sj_deity = {
            name = "Deity",
            text = {
                "Create a random",
                "spectral card"
            }
       }
    },
    misc = {

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Hands",
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Remaining",
            a_sold_tally="#1#/#2# Sold",
            a_xmult="X#1# Mult",
            a_xmult_minus="-X#1# Mult",
        }
    }
}
}
