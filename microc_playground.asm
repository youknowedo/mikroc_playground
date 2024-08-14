
_main:

;microc_playground.c,3 :: 		void main()
;microc_playground.c,6 :: 		TRISA = 0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;microc_playground.c,7 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;microc_playground.c,8 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;microc_playground.c,9 :: 		osccon = 0x77;
	MOVLW      119
	MOVWF      OSCCON+0
;microc_playground.c,10 :: 		ANSEL = 0b00000000;
	CLRF       ANSEL+0
;microc_playground.c,11 :: 		ANSELH = 0b00000000;
	CLRF       ANSELH+0
;microc_playground.c,13 :: 		while (1 == 1)
L_main0:
;microc_playground.c,15 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;microc_playground.c,16 :: 		PORTB = 0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;microc_playground.c,18 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,19 :: 		PORTB = 0b00000010;
	MOVLW      2
	MOVWF      PORTB+0
;microc_playground.c,21 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,22 :: 		PORTB = 0b00000100;
	MOVLW      4
	MOVWF      PORTB+0
;microc_playground.c,24 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,25 :: 		PORTB = 0b00001000;
	MOVLW      8
	MOVWF      PORTB+0
;microc_playground.c,27 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,28 :: 		PORTB = 0b00010000;
	MOVLW      16
	MOVWF      PORTB+0
;microc_playground.c,30 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,31 :: 		PORTB = 0b00100000;
	MOVLW      32
	MOVWF      PORTB+0
;microc_playground.c,33 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,34 :: 		PORTB = 0b01000000;
	MOVLW      64
	MOVWF      PORTB+0
;microc_playground.c,36 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,37 :: 		PORTB = 0b10000000;
	MOVLW      128
	MOVWF      PORTB+0
;microc_playground.c,39 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,40 :: 		}
	GOTO       L_main0
;microc_playground.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_delay:

;microc_playground.c,43 :: 		void delay(int nTime)
;microc_playground.c,45 :: 		while (nTime != 0)
L_delay2:
	MOVLW      0
	XORWF      FARG_delay_nTime+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay6
	MOVLW      0
	XORWF      FARG_delay_nTime+0, 0
L__delay6:
	BTFSC      STATUS+0, 2
	GOTO       L_delay3
;microc_playground.c,47 :: 		nTime = nTime - 1;
	MOVLW      1
	SUBWF      FARG_delay_nTime+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_delay_nTime+1, 1
;microc_playground.c,48 :: 		}
	GOTO       L_delay2
L_delay3:
;microc_playground.c,49 :: 		}
L_end_delay:
	RETURN
; end of _delay
