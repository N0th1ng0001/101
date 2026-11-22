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
            },
            j_sj_8_of_Spades={
                name = "8 of Spades",
                text = {
                    {
                        "8^8 mult and 8 dollars",
                        "whenever an 8 of Spades is played"
                    }
                }
            },
            j_sj_Inverted_Wheel={
                name = "Inverted Wheel",
                text = {
                    {
                        "When a Wheel of Fortune is used,",
                        "set a random joker to negative.",
                        "When an Aura is used,",
                        "set the card to negative"
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
        },
        b_sj_texas_deck = {
            name = "Texas Deck",
            text = {
                "Draw 2 cards",
                "After each blind add",
                "an eighth the total chips scored to the chip gain",
                "{C:inactive} Currently {C:inactive} has {C:chips} #2# {C:chips} chips"
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
       },
       c_sj_disease = {
            name = "Disease",
            text = {
                "Apply a Amoeba Seal",
                "To 1 selected card"
            }
       },
    },
    Enhanced = {
        m_sj_scribble = {
            name = "Scribble",
            text = {
                "Adds a random amount of bonus chips"
            }
        }
    },
    Other = {
        sj_amoeba = {
            name = "Amoeba Seal",
            text = {"1 in 4 chance to create",
                    "a copy of this card"
                    }
        }   
    },
    misc = {

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            k_sj_weird = "Weird",
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
        },
        labels = {
            sj_weird = "Weird",
        }
    }
}
}
