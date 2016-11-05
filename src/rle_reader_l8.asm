;; ************************************************************
;; rle_reader()
;; ************************************************************
;; 
;; This version outputs in list8_life format 
;; 
;; params
;; - src = pointer to raw RLE data
;; - this = pointer to output buffer
;;
;; uses
;; - src
;; - this
;; - temp
;; - xx
;; - yy
;; - count
        

.rle_reader
{
        JSR parse_rle_header
        JSR offset_pattern
        LDY #1
        JSR init_yy
        JSR init_xx
        JSR zero_count
        JSR insert_y
.loop        
        LDA (src)
        BEQ done
        CMP #'!'
        BEQ done
        CMP #' '                ; skip over white space
        BEQ continue
        CMP #10                 ; skip over <NL>
        BEQ continue
        CMP #13                 ; skip over <CR>
        BEQ continue        
        CMP #'0'                ; RLE count
        BCC not_digit
        CMP #'9'+1
        BCC digit
.not_digit
        CMP #'b'                ; dead cell
        BEQ jmp_insert_blanks
        CMP #'o'                ; live cell
        BEQ jmp_insert_cells
        CMP #'$'                ; end of line
        BEQ jmp_insert_eols
        
        ;; probably an error, but continue anyway....

.continue
        M_INCREMENT src
        BRA loop
                
.done
        LDA #0
        STA (this)
        STA (this),Y
        M_INCREMENT_BY_2 this
        RTS        

.jmp_insert_blanks
        JMP insert_blanks
        
.jmp_insert_cells
        JMP insert_cells
        
.jmp_insert_eols
        JMP insert_eols
        
.digit
        AND #&0F
        TAX
        JSR count_times_10      ; othewise multiply by 10
        TXA
        CLC
        ADC count               ; and add the digit
        STA count
        LDA count + 1
        ADC #0
        STA count + 1
        JMP continue
        
.insert_cells
        JSR default_count
.cells_loop        
        LDA count
        ORA count + 1
        BEQ continue        
        LDA xx
        STA (this)
        LDA xx + 1
        STA (this),Y        
        M_INCREMENT_BY_2 this
        M_INCREMENT xx        
        M_DECREMENT count
        BRA cells_loop
        
.insert_blanks
        JSR default_count
        LDA xx
        CLC
        ADC count
        STA xx
        LDA xx + 1
        ADC count + 1
        STA xx + 1
        JSR zero_count
        JMP continue
        
.insert_eols
        JSR default_count
        LDA yy
        SEC
        SBC count
        STA yy
        LDA yy + 1
        SBC count + 1
        STA yy + 1
        JSR insert_y
        JSR init_xx
        JSR zero_count
        JMP continue
}        

.insert_y
{        
        LDA yy
        STA (this)
        LDA yy + 1
        STA (this),Y
        M_INCREMENT_BY_2 this
        RTS
}        

.init_xx
{
        LDA pat_width           ; pat_width holds the x coord to load at
        STA xx
        LDA pat_width + 1
        STA xx + 1
        RTS
}

.init_yy
{
        LDA pat_depth           ; pat_depth holds the y coord to load at
        STA yy
        LDA pat_depth + 1
        STA yy + 1
        RTS
}


.zero_count
{
        STZ count
        STZ count + 1
        RTS
}

.default_count
{        
        LDA count               ; test if count still zero
        ORA count + 1
        BNE return
        LDA #1                  ; if so, default to 1
        STA count
.return
        RTS
}
