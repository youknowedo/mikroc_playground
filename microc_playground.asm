
_main:

;microc_playground.c,6 :: 		void main()
;microc_playground.c,8 :: 		init();
	CALL       _init+0
;microc_playground.c,10 :: 		while (1 == 1)
L_main0:
;microc_playground.c,12 :: 		waterfall();
	CALL       _waterfall+0
;microc_playground.c,13 :: 		waterfallReverse();
	CALL       _waterfallReverse+0
;microc_playground.c,14 :: 		}
	GOTO       L_main0
;microc_playground.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_delay:

;microc_playground.c,17 :: 		void delay(int nTime)
;microc_playground.c,19 :: 		while (nTime != 0)
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
;microc_playground.c,21 :: 		nTime = nTime - 1;
	MOVLW      1
	SUBWF      FARG_delay_nTime+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_delay_nTime+1, 1
;microc_playground.c,22 :: 		}
	GOTO       L_delay2
L_delay3:
;microc_playground.c,23 :: 		}
L_end_delay:
	RETURN
; end of _delay

_init:

;microc_playground.c,25 :: 		void init()
;microc_playground.c,27 :: 		TRISA = 0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;microc_playground.c,28 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;microc_playground.c,29 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;microc_playground.c,30 :: 		osccon = 0x77;
	MOVLW      119
	MOVWF      OSCCON+0
;microc_playground.c,31 :: 		ANSEL = 0b00000000;
	CLRF       ANSEL+0
;microc_playground.c,32 :: 		ANSELH = 0b00000000;
	CLRF       ANSELH+0
;microc_playground.c,33 :: 		}
L_end_init:
	RETURN
; end of _init

_waterfall:

;microc_playground.c,35 :: 		void waterfall()
;microc_playground.c,37 :: 		PORTB = 0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;microc_playground.c,38 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,39 :: 		PORTB = 0b00000010;
	MOVLW      2
	MOVWF      PORTB+0
;microc_playground.c,40 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,41 :: 		PORTB = 0b00000100;
	MOVLW      4
	MOVWF      PORTB+0
;microc_playground.c,42 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,43 :: 		PORTB = 0b00001000;
	MOVLW      8
	MOVWF      PORTB+0
;microc_playground.c,44 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,45 :: 		PORTB = 0b00010000;
	MOVLW      16
	MOVWF      PORTB+0
;microc_playground.c,46 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,47 :: 		PORTB = 0b00100000;
	MOVLW      32
	MOVWF      PORTB+0
;microc_playground.c,48 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,49 :: 		PORTB = 0b01000000;
	MOVLW      64
	MOVWF      PORTB+0
;microc_playground.c,50 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,51 :: 		PORTB = 0b10000000;
	MOVLW      128
	MOVWF      PORTB+0
;microc_playground.c,52 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,53 :: 		}
L_end_waterfall:
	RETURN
; end of _waterfall

_waterfallReverse:

;microc_playground.c,54 :: 		void waterfallReverse()
;microc_playground.c,56 :: 		PORTB = 0b10000000;
	MOVLW      128
	MOVWF      PORTB+0
;microc_playground.c,57 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,58 :: 		PORTB = 0b01000000;
	MOVLW      64
	MOVWF      PORTB+0
;microc_playground.c,59 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,60 :: 		PORTB = 0b00100000;
	MOVLW      32
	MOVWF      PORTB+0
;microc_playground.c,61 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,62 :: 		PORTB = 0b00010000;
	MOVLW      16
	MOVWF      PORTB+0
;microc_playground.c,63 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,64 :: 		PORTB = 0b00001000;
	MOVLW      8
	MOVWF      PORTB+0
;microc_playground.c,65 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,66 :: 		PORTB = 0b00000100;
	MOVLW      4
	MOVWF      PORTB+0
;microc_playground.c,67 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,68 :: 		PORTB = 0b00000010;
	MOVLW      2
	MOVWF      PORTB+0
;microc_playground.c,69 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,70 :: 		PORTB = 0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;microc_playground.c,71 :: 		delay(32767);
	MOVLW      255
	MOVWF      FARG_delay_nTime+0
	MOVLW      127
	MOVWF      FARG_delay_nTime+1
	CALL       _delay+0
;microc_playground.c,72 :: 		}
L_end_waterfallReverse:
	RETURN
; end of _waterfallReverse
