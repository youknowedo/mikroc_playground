
_main:

;microc_playground.c,5 :: 		void main()
;microc_playground.c,7 :: 		TRISA = 0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;microc_playground.c,8 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;microc_playground.c,9 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;microc_playground.c,10 :: 		osccon = 0x77;
	MOVLW      119
	MOVWF      OSCCON+0
;microc_playground.c,11 :: 		ANSEL = 0b00000000;
	CLRF       ANSEL+0
;microc_playground.c,12 :: 		ANSELH = 0b00000000;
	CLRF       ANSELH+0
;microc_playground.c,14 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;microc_playground.c,15 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;microc_playground.c,16 :: 		intcon.INTF=0;
	BCF        INTCON+0, 1
;microc_playground.c,18 :: 		PORTC = 0b00000001;
	MOVLW      1
	MOVWF      PORTC+0
;microc_playground.c,19 :: 		delay_ms(75);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
;microc_playground.c,21 :: 		while (1 == 1)
L_main1:
;microc_playground.c,22 :: 		knightRider();
	CALL       _knightRider+0
	GOTO       L_main1
;microc_playground.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_knightRider:

;microc_playground.c,25 :: 		void knightRider()
;microc_playground.c,27 :: 		PORTC = 0b00000001;
	MOVLW      1
	MOVWF      PORTC+0
;microc_playground.c,28 :: 		PORTC.F0 = PORTA.F0 ? ~PORTC.F0 : PORTC.F0;
	BTFSS      PORTA+0, 0
	GOTO       L_knightRider3
	BTFSC      PORTC+0, 0
	GOTO       L__knightRider17
	BSF        ?FLOC___knightRiderT10+0, BitPos(?FLOC___knightRiderT10+0)
	GOTO       L__knightRider18
L__knightRider17:
	BCF        ?FLOC___knightRiderT10+0, BitPos(?FLOC___knightRiderT10+0)
L__knightRider18:
	GOTO       L_knightRider4
L_knightRider3:
	BTFSC      PORTC+0, 0
	GOTO       L__knightRider19
	BCF        ?FLOC___knightRiderT10+0, BitPos(?FLOC___knightRiderT10+0)
	GOTO       L__knightRider20
L__knightRider19:
	BSF        ?FLOC___knightRiderT10+0, BitPos(?FLOC___knightRiderT10+0)
L__knightRider20:
L_knightRider4:
	BTFSC      ?FLOC___knightRiderT10+0, BitPos(?FLOC___knightRiderT10+0)
	GOTO       L__knightRider21
	BCF        PORTC+0, 0
	GOTO       L__knightRider22
L__knightRider21:
	BSF        PORTC+0, 0
L__knightRider22:
;microc_playground.c,29 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;microc_playground.c,30 :: 		while (i < 14)
L_knightRider5:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightRider23
	MOVLW      14
	SUBWF      _i+0, 0
L__knightRider23:
	BTFSC      STATUS+0, 0
	GOTO       L_knightRider6
;microc_playground.c,32 :: 		PORTC.F0 = PORTA.F0 ? ~PORTC.F0 : PORTC.F0;
	BTFSS      PORTA+0, 0
	GOTO       L_knightRider7
	BTFSC      PORTC+0, 0
	GOTO       L__knightRider24
	BSF        ?FLOC___knightRiderT18+0, BitPos(?FLOC___knightRiderT18+0)
	GOTO       L__knightRider25
L__knightRider24:
	BCF        ?FLOC___knightRiderT18+0, BitPos(?FLOC___knightRiderT18+0)
L__knightRider25:
	GOTO       L_knightRider8
L_knightRider7:
	BTFSC      PORTC+0, 0
	GOTO       L__knightRider26
	BCF        ?FLOC___knightRiderT18+0, BitPos(?FLOC___knightRiderT18+0)
	GOTO       L__knightRider27
L__knightRider26:
	BSF        ?FLOC___knightRiderT18+0, BitPos(?FLOC___knightRiderT18+0)
L__knightRider27:
L_knightRider8:
	BTFSC      ?FLOC___knightRiderT18+0, BitPos(?FLOC___knightRiderT18+0)
	GOTO       L__knightRider28
	BCF        PORTC+0, 0
	GOTO       L__knightRider29
L__knightRider28:
	BSF        PORTC+0, 0
L__knightRider29:
;microc_playground.c,33 :: 		PORTC = i < 7 ? PORTC << 1 : PORTC >> 1;
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightRider30
	MOVLW      7
	SUBWF      _i+0, 0
L__knightRider30:
	BTFSC      STATUS+0, 0
	GOTO       L_knightRider9
	MOVF       PORTC+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	RLF        R1+0, 1
	RLF        R1+1, 1
	BCF        R1+0, 0
	GOTO       L_knightRider10
L_knightRider9:
	MOVF       PORTC+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVLW      0
	MOVWF      R1+1
L_knightRider10:
	MOVF       R1+0, 0
	MOVWF      PORTC+0
;microc_playground.c,34 :: 		PORTC.F0 = PORTA.F0 ? ~PORTC.F0 : PORTC.F0;
	BTFSS      PORTA+0, 0
	GOTO       L_knightRider11
	BTFSC      PORTC+0, 0
	GOTO       L__knightRider31
	BSF        ?FLOC___knightRiderT29+0, BitPos(?FLOC___knightRiderT29+0)
	GOTO       L__knightRider32
L__knightRider31:
	BCF        ?FLOC___knightRiderT29+0, BitPos(?FLOC___knightRiderT29+0)
L__knightRider32:
	GOTO       L_knightRider12
L_knightRider11:
	BTFSC      PORTC+0, 0
	GOTO       L__knightRider33
	BCF        ?FLOC___knightRiderT29+0, BitPos(?FLOC___knightRiderT29+0)
	GOTO       L__knightRider34
L__knightRider33:
	BSF        ?FLOC___knightRiderT29+0, BitPos(?FLOC___knightRiderT29+0)
L__knightRider34:
L_knightRider12:
	BTFSC      ?FLOC___knightRiderT29+0, BitPos(?FLOC___knightRiderT29+0)
	GOTO       L__knightRider35
	BCF        PORTC+0, 0
	GOTO       L__knightRider36
L__knightRider35:
	BSF        PORTC+0, 0
L__knightRider36:
;microc_playground.c,35 :: 		delay_ms(75);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_knightRider13:
	DECFSZ     R13+0, 1
	GOTO       L_knightRider13
	DECFSZ     R12+0, 1
	GOTO       L_knightRider13
;microc_playground.c,36 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;microc_playground.c,37 :: 		}
	GOTO       L_knightRider5
L_knightRider6:
;microc_playground.c,38 :: 		}
L_end_knightRider:
	RETURN
; end of _knightRider

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;microc_playground.c,40 :: 		void interrupt()
;microc_playground.c,44 :: 		portc = 0xff;
	MOVLW      255
	MOVWF      PORTC+0
;microc_playground.c,45 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_interrupt14:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt14
	DECFSZ     R12+0, 1
	GOTO       L_interrupt14
	DECFSZ     R11+0, 1
	GOTO       L_interrupt14
	NOP
;microc_playground.c,46 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;microc_playground.c,47 :: 		}
L_end_interrupt:
L__interrupt38:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
