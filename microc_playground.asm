
_main:

;microc_playground.c,6 :: 		void main()
;microc_playground.c,8 :: 		init();
	CALL       _init+0
;microc_playground.c,10 :: 		PORTC = 0b00000001;
	MOVLW      1
	MOVWF      PORTC+0
;microc_playground.c,11 :: 		delay_ms(75);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
;microc_playground.c,13 :: 		while (1 == 1)
L_main1:
;microc_playground.c,14 :: 		knightRider();
	CALL       _knightRider+0
	GOTO       L_main1
;microc_playground.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_init:

;microc_playground.c,17 :: 		void init()
;microc_playground.c,19 :: 		TRISA = 0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;microc_playground.c,20 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;microc_playground.c,21 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;microc_playground.c,22 :: 		osccon = 0x77;
	MOVLW      119
	MOVWF      OSCCON+0
;microc_playground.c,23 :: 		ANSEL = 0b00000000;
	CLRF       ANSEL+0
;microc_playground.c,24 :: 		ANSELH = 0b00000000;
	CLRF       ANSELH+0
;microc_playground.c,25 :: 		}
L_end_init:
	RETURN
; end of _init

_knightRider:

;microc_playground.c,27 :: 		void knightRider()
;microc_playground.c,29 :: 		PORTC = 0b00000001;
	MOVLW      1
	MOVWF      PORTC+0
;microc_playground.c,30 :: 		PORTC.F0 = ~PORTC.F0;
	MOVLW      1
	XORWF      PORTC+0, 1
;microc_playground.c,31 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;microc_playground.c,32 :: 		while (i < 14)
L_knightRider3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightRider11
	MOVLW      14
	SUBWF      _i+0, 0
L__knightRider11:
	BTFSC      STATUS+0, 0
	GOTO       L_knightRider4
;microc_playground.c,34 :: 		PORTC.F0 = ~PORTC.F0;
	MOVLW      1
	XORWF      PORTC+0, 1
;microc_playground.c,35 :: 		PORTC = i < 7 ? PORTC << 1 : PORTC >> 1;
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightRider12
	MOVLW      7
	SUBWF      _i+0, 0
L__knightRider12:
	BTFSC      STATUS+0, 0
	GOTO       L_knightRider5
	MOVF       PORTC+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	RLF        R1+0, 1
	RLF        R1+1, 1
	BCF        R1+0, 0
	GOTO       L_knightRider6
L_knightRider5:
	MOVF       PORTC+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVLW      0
	MOVWF      R1+1
L_knightRider6:
	MOVF       R1+0, 0
	MOVWF      PORTC+0
;microc_playground.c,36 :: 		PORTC.F0 = ~PORTC.F0;
	MOVLW      1
	XORWF      PORTC+0, 1
;microc_playground.c,37 :: 		delay_ms(75);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_knightRider7:
	DECFSZ     R13+0, 1
	GOTO       L_knightRider7
	DECFSZ     R12+0, 1
	GOTO       L_knightRider7
;microc_playground.c,38 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;microc_playground.c,39 :: 		}
	GOTO       L_knightRider3
L_knightRider4:
;microc_playground.c,40 :: 		}
L_end_knightRider:
	RETURN
; end of _knightRider
