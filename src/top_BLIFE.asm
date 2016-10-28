_ATOM           = FALSE
        
rows_per_screen = &FE           ; Y resolution

scrn_base       = &4000         ; base address of screen memory

wkspc0          = &3400         ; workspace 1 (temp copy of a screen row)
wkspc1          = &3421         ; workspace 2 (temp copy of a screen row)
wkspc2          = &3442         ; workspace 3 (temp copy of a screen row)

sum             = &3463         ; pixel accumulator

delta_base      = &3800         ; 8 row buffer for accumulating delta
        
gen_lo          = &1FFE         ; generation counter
gen_hi          = &1FFF         ; the C% integer variable on the Beeb

wrcvec          = &020E
        
OSWORD          = &FFF1
OSWRCH          = &FFEE
OSRDCH          = &FFE0
        
org               &2000         ; base address of the code on the Beeb

.start

JMP beeb_life        
        
include "vdu_driver.asm"
        
include "atom_life.asm"

include "beeb_wrapper.asm"

include "patterns.asm"

include "utils.asm"

.end

SAVE "",start, end
        