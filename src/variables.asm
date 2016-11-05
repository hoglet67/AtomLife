;; TODO - tidy up these allocations
        
;; List Life Engine

this            = &80           ; used by both
new             = &82           ; used by both
temp            = &84           ; used by both
xx              = &86           ; used by both
yy              = &88           ; used by both        
prev            = &8A           ; used by list_life()
next            = &8C           ; used by list_life()
bitmap          = &8E           ; used by list_life()
list            = &60           ; used by list_life_update_delta()
xstart          = &62           ; used by list_life_update_delta()
ystart          = &64           ; used by list_life_update_delta()
xend            = &66           ; used by list_life_update_delta()
yend            = &68           ; used by list_life_update_delta()        
stash           = &6A
pan_x           = &6C
pan_y           = &6E
        

;; Additional locations used by list8 life
foreprev        = &40
forethis        = &41
forenext        = &42
middprev        = &43
middthis        = &44
middnext        = &45
rearprev        = &46
rearthis        = &47
rearnext        = &48
hicnt_f         = &49
locnt_f         = &4A
hicnt_m         = &4B
locnt_m         = &4C
hicnt_r         = &4D
locnt_r         = &4E
t               = &4F
mask            = &50
outcome         = &51        
        
;; Utils

tmp             = &70
delta           = &72           ; pointer to 8-line block storing difference between this and next

;; Patterns

src             = &74
dst             = &76
pat_width       = &78
pat_depth       = &7A

;; RLE Reader uses
;; - src   = &74
;; - this  = &80
;; - temp  = &84
;; - xx    = &86
;; - yy    = &88
;; - count = &7A
        
;; Beeb Wrapper

count           = &7A      
new_xstart      = &7C
new_ystart      = &7E
                
;; Atom Life Engine

pixels          = &80           ; block of 8 pixels (cells) being updates
sum_idx         = &82           ; index into the pixel accumulator
tmpY            = &83           ; temp storage for Y register
tmpC            = &84           ; temp storage for carry flag
numrows         = &85           ; row counter, decrements down to zer0
row1            = &87           ; pointer to row1 in the workspace (the one being updated)
sum_ptr         = &89           ; set but not UNUSED
scrn_tmp        = &8B           ; pointer to the current row in screen memory
row0            = &8D           ; pointer to row0 in the workspace (the row above)
row2            = &8F           ; pointer to row0 in the workspace (the row beloe)

;; Atom Life Engine and other stuff

scrn            = &91           ; pointer to the next row in screen memory

