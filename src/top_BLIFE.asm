_ATOM           = FALSE

_ATOM_LIFE_ENGINE = FALSE

rows_per_screen = &FE           ; Y resolution

scrn_base       = &4000         ; base address of screen memory

wkspc0          = &3400         ; workspace 1 (temp copy of a screen row)
wkspc1          = &3500         ; workspace 2 (temp copy of a screen row)
wkspc2          = &3600         ; workspace 3 (temp copy of a screen row)

sum             = &3700         ; pixel accumulator

delta_base      = &3800         ; 8 row buffer for accumulating delta

buffer1         = &9C00         ; 9C00-F7FF = 23K        

buffer2         = &4000         ; 4000-9BFF = 23K
        
gen_lo          = &1FFE         ; generation counter
gen_hi          = &1FFF         ; the C% integer variable on the Beeb
        
org               &2000         ; base address of the code on the Beeb

include "constants.asm"
        
include "variables.asm"

include "macros.asm"
        
.start

JMP beeb_life        
        
include "vdu_driver.asm"
        
include "utils.asm"

include "patterns.asm"

include "atom_life.asm"

include "list_life.asm"

include "beeb_wrapper.asm"

include "rle_reader.asm"

org &6000
        
include "breeder.asm"
        
.end

SAVE "",start, end
        
