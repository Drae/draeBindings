if (select(2, UnitClass "player") ~= "HUNTER") then
    return
end

local _, bindings = ...

--[[
        Clique setup
        ------------

        Mirror setup here for mouseover abilities

        General setup
        -------------

        ", # 					- primary rotation abilities
        BUTTON4					-
        BUTTON5					- Stings
        BUTTON3					- Interrupts/Stuns/CC

        5 						- all defensive cooldowns, camoflage
        7						- Revive Pet/Mend Pet

        9						- Misc / Talents

        C						- Pet attack, follow, revive, etc.
        T						- Traps
        E						- Taunts
        F						- Get out of jail free -> Every man for himself, Healthstone
        R						- Trinkets
        G						- Cooldown
        `						- Avenging Wrath and anything that should be tied to its use
        \						- Redemption/Mass Ressurection
--]]
local hunterBase = {
    -- Mouse based
    BUTTON3 = "m|/stopcasting\n/cast Counter Shot", -- Talent
    [6] = "m|/stopcasting\n/cast Feign Death",
    [7] = "m|/cast [modifier] Revive Pet; [@pet,dead] Revive Pet; [pet] Mend Pet",
    [";"] = "m|/cast [talent:1/3] A Murder of Crows; [talent:6/2] Barrage",
    -- Keyboard based
    C = "m|/petattack [nomodifier,pet]",
    R = "m|/q 0\n/use 13\n/q 1", -- Trinket Slot 1
    T = "m|/cast Freezing Trap",
    shift = {
        [";"] = "m|/cast [@focus,exists,help] Misdirection;[@pet,exists,nodead] Misdirection",
        [6] = "m|/cancelaura Aspect of the Turtle\n/stopcasting\n/cast Aspect of the Turtle",
        [9] = "s|Aspect of the Cheetah",
        C = "m|/petfollow [pet]",
        T = "s|Tar Trap",
        R = "m|/q 0\n/use 14\n/q 1" -- Trinket Slot 2
    },
    alt = {
        [";"] = "m|/cast [@FOCUS,exists,harm][] Concussive Shot",
        [6] = "m|/stopcasting\n/cast Disengage",
        -- Keyboard
        ["\\"] = "s|Heart of the Phoenix"
    },
    ctrl = {
        [6] = "s|Exhilaration"
    }
}

local survival = {
    -- Mouse based

    -- Keyboard based
    C = "m|/stopcasting\n/cast [@mouseover,help] Master's Call; [@player] Master's Call",
    alt = {
        -- Mouse based

        -- Keyboard based
        T = "s|Explosive Trap"
    }
}

local beastmastery = {
    BUTTON4 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Barbed Shot",
    BUTTON5 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Cobra Shot",
    ["`"] = "m|/castsequence reset=2 Bestial Wrath, Aspect of the Wild",
    shift = {
        BUTTON3 = "m|/cast [talent:5/1,@CURSOR] Binding Shot\n/cast [talent:5/2] Wyvern Sting\n/cast [talent:5/3] Intimidation",
        BUTTON4 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Multi-Shot",
        BUTTON5 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Kill Command",
        ["`"] = "s|Stampede"
    },
    alt = {
        BUTTON5 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Chimaera Shot"
    }
}

local marksmanship = {
    BUTTON5 = "s|Steady Shot",
    BUTTON4 = "s|Aimed Shot",
    [8] = "s|Rapid Fire",
    ["`"] = "m|/q 0\n/use 13\n/q 1\n/cast Trueshot",
    shift = {
        BUTTON3 = "m|/cast [talent:5/3,@CURSOR] Binding Shot\n/cast [talent:3/3] Camouflage",
        BUTTON4 = "s|Multi-Shot",
        BUTTON5 = "s|Arcane Shot",
        [8] = "m|/cast [talent:7/3] Piercing Shot"
    },
    alt = {
        BUTTON3 = "s|Bursting Shot",
        [";"] = "m|/cast [talent:4/1,@CURSOR] Explosive Shot",
        ["C"] = "s|Hunter's Mark"
    }
}

draeBindings:RegisterKeyBindings("Beast Mastery", bindings.base, hunterBase, beastmastery)
draeBindings:RegisterKeyBindings("Survival", bindings.base, hunterBase, survival)
draeBindings:RegisterKeyBindings("Marksmanship", bindings.base, hunterBase, marksmanship)
