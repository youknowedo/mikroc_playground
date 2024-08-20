
_main:

;microc_playground.c,18 :: 		void main()
;microc_playground.c,20 :: 		TRISA = 0b00000000;
	CLRF       TRISA+0
;microc_playground.c,21 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;microc_playground.c,22 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;microc_playground.c,23 :: 		osccon = 0x77;
	MOVLW      119
	MOVWF      OSCCON+0
;microc_playground.c,24 :: 		ANSEL = 0b00000000;
	CLRF       ANSEL+0
;microc_playground.c,25 :: 		ANSELH = 0b00000000;
	CLRF       ANSELH+0
;microc_playground.c,27 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;microc_playground.c,28 :: 		INTCON.TMR0IE = 1;
	BSF        INTCON+0, 5
;microc_playground.c,29 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;microc_playground.c,31 :: 		OPTION_REG.T0CS = 0;
	BCF        OPTION_REG+0, 5
;microc_playground.c,32 :: 		OPTION_REG.PSA = 1;
	BSF        OPTION_REG+0, 3
;microc_playground.c,33 :: 		OPTION_REG.T0SE = 0;
	BCF        OPTION_REG+0, 4
;microc_playground.c,34 :: 		OPTION_REG.PS2 = 0;
	BCF        OPTION_REG+0, 2
;microc_playground.c,35 :: 		OPTION_REG.PS1 = 0;
	BCF        OPTION_REG+0, 1
;microc_playground.c,36 :: 		OPTION_REG.PS0 = 0;
	BCF        OPTION_REG+0, 0
;microc_playground.c,38 :: 		for (i = 1000; i > 0; i--)
	MOVLW      232
	MOVWF      _i+0
	MOVLW      3
	MOVWF      _i+1
L_main0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVF       _i+0, 0
	SUBLW      0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;microc_playground.c,40 :: 		for (j = 0; j < 4; j++)
	CLRF       _j+0
	CLRF       _j+1
L_main3:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      4
	SUBWF      _j+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;microc_playground.c,42 :: 		PORTB = numbers[(i / pow(10, j)) % 10];
	MOVLW      10
	MOVWF      FARG_pow_x+0
	MOVLW      0
	MOVWF      FARG_pow_x+1
	MOVF       _j+0, 0
	MOVWF      FARG_pow_n+0
	MOVF       _j+1, 0
	MOVWF      FARG_pow_n+1
	CALL       _pow+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;microc_playground.c,43 :: 		if (j == 2)
	MOVLW      0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      2
	XORWF      _j+0, 0
L__main20:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;microc_playground.c,44 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
L_main6:
;microc_playground.c,45 :: 		PORTA = 0b00001000 >> j;
	MOVF       _j+0, 0
	MOVWF      R1+0
	MOVLW      8
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main21:
	BTFSC      STATUS+0, 2
	GOTO       L__main22
	RRF        R0+0, 1
	BCF        R0+0, 7
	BTFSC      R0+0, 6
	BSF        R0+0, 7
	ADDLW      255
	GOTO       L__main21
L__main22:
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;microc_playground.c,46 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
;microc_playground.c,40 :: 		for (j = 0; j < 4; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;microc_playground.c,47 :: 		}
	GOTO       L_main3
L_main4:
;microc_playground.c,38 :: 		for (i = 1000; i > 0; i--)
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;microc_playground.c,48 :: 		}
	GOTO       L_main0
L_main1:
;microc_playground.c,50 :: 		while (1)
L_main8:
;microc_playground.c,52 :: 		for (j = 0; j < 4; j++)
	CLRF       _j+0
	CLRF       _j+1
L_main10:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      4
	SUBWF      _j+0, 0
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;microc_playground.c,54 :: 		PORTB = ~PORTA;
	COMF       PORTA+0, 0
	MOVWF      PORTB+0
;microc_playground.c,55 :: 		PORTA = 0b00001000 >> j;
	MOVF       _j+0, 0
	MOVWF      R1+0
	MOVLW      8
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main24:
	BTFSC      STATUS+0, 2
	GOTO       L__main25
	RRF        R0+0, 1
	BCF        R0+0, 7
	BTFSC      R0+0, 6
	BSF        R0+0, 7
	ADDLW      255
	GOTO       L__main24
L__main25:
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;microc_playground.c,56 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
;microc_playground.c,52 :: 		for (j = 0; j < 4; j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;microc_playground.c,57 :: 		}
	GOTO       L_main10
L_main11:
;microc_playground.c,58 :: 		}
	GOTO       L_main8
;microc_playground.c,59 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_pow:

;microc_playground.c,61 :: 		int pow(int x, int n)
;microc_playground.c,64 :: 		int number = 1;
	MOVLW      1
	MOVWF      pow_number_L0+0
	MOVLW      0
	MOVWF      pow_number_L0+1
;microc_playground.c,66 :: 		for (i = 0; i < n; ++i)
	CLRF       pow_i_L0+0
	CLRF       pow_i_L0+1
L_pow14:
	MOVLW      128
	XORWF      pow_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_pow_n+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pow27
	MOVF       FARG_pow_n+0, 0
	SUBWF      pow_i_L0+0, 0
L__pow27:
	BTFSC      STATUS+0, 0
	GOTO       L_pow15
;microc_playground.c,67 :: 		number *= x;
	MOVF       pow_number_L0+0, 0
	MOVWF      R0+0
	MOVF       pow_number_L0+1, 0
	MOVWF      R0+1
	MOVF       FARG_pow_x+0, 0
	MOVWF      R4+0
	MOVF       FARG_pow_x+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      pow_number_L0+0
	MOVF       R0+1, 0
	MOVWF      pow_number_L0+1
;microc_playground.c,66 :: 		for (i = 0; i < n; ++i)
	INCF       pow_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       pow_i_L0+1, 1
;microc_playground.c,67 :: 		number *= x;
	GOTO       L_pow14
L_pow15:
;microc_playground.c,69 :: 		return (number);
	MOVF       pow_number_L0+0, 0
	MOVWF      R0+0
	MOVF       pow_number_L0+1, 0
	MOVWF      R0+1
;microc_playground.c,70 :: 		}
L_end_pow:
	RETURN
; end of _pow
