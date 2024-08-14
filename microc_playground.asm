
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
;microc_playground.c,14 :: 		waterfall();
	CALL       _waterfall+0
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

_waterfall:

;microc_playground.c,27 :: 		void waterfall()
;microc_playground.c,29 :: 		PORTC = 0b00000001;
	MOVLW      1
	MOVWF      PORTC+0
;microc_playground.c,30 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;microc_playground.c,31 :: 		while (i < 7)
L_waterfall3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__waterfall12
	MOVLW      7
	SUBWF      _i+0, 0
L__waterfall12:
	BTFSC      STATUS+0, 0
	GOTO       L_waterfall4
;microc_playground.c,33 :: 		PORTC = PORTC << 1;
	MOVF       PORTC+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;microc_playground.c,34 :: 		delay_ms(75);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_waterfall5:
	DECFSZ     R13+0, 1
	GOTO       L_waterfall5
	DECFSZ     R12+0, 1
	GOTO       L_waterfall5
;microc_playground.c,35 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;microc_playground.c,36 :: 		}
	GOTO       L_waterfall3
L_waterfall4:
;microc_playground.c,38 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;microc_playground.c,39 :: 		while (i < 7)
L_waterfall6:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__waterfall13
	MOVLW      7
	SUBWF      _i+0, 0
L__waterfall13:
	BTFSC      STATUS+0, 0
	GOTO       L_waterfall7
;microc_playground.c,41 :: 		PORTC = PORTC >> 1;
	MOVF       PORTC+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;microc_playground.c,42 :: 		delay_ms(75);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_waterfall8:
	DECFSZ     R13+0, 1
	GOTO       L_waterfall8
	DECFSZ     R12+0, 1
	GOTO       L_waterfall8
;microc_playground.c,43 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;microc_playground.c,44 :: 		}
	GOTO       L_waterfall6
L_waterfall7:
;microc_playground.c,45 :: 		}
L_end_waterfall:
	RETURN
; end of _waterfall
