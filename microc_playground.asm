
_main:

;microc_playground.c,21 :: 		void main()
;microc_playground.c,23 :: 		TRISA = 0b11110000;
	MOVLW      240
	MOVWF      TRISA+0
;microc_playground.c,24 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;microc_playground.c,25 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;microc_playground.c,26 :: 		osccon = 0x77;
	MOVLW      119
	MOVWF      OSCCON+0
;microc_playground.c,27 :: 		ANSEL = 0b00000000;
	CLRF       ANSEL+0
;microc_playground.c,28 :: 		ANSELH = 0b00000000;
	CLRF       ANSELH+0
;microc_playground.c,30 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;microc_playground.c,31 :: 		INTCON.TMR0IE = 1;
	BSF        INTCON+0, 5
;microc_playground.c,32 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;microc_playground.c,34 :: 		OPTION_REG.T0SE = 1;
	BSF        OPTION_REG+0, 4
;microc_playground.c,35 :: 		OPTION_REG.T0CS = 0;
	BCF        OPTION_REG+0, 5
;microc_playground.c,36 :: 		OPTION_REG.PSA = 0;
	BCF        OPTION_REG+0, 3
;microc_playground.c,38 :: 		OPTION_REG.PS0 = 0;
	BCF        OPTION_REG+0, 0
;microc_playground.c,39 :: 		OPTION_REG.PS1 = 0;
	BCF        OPTION_REG+0, 1
;microc_playground.c,40 :: 		OPTION_REG.PS2 = 1;
	BSF        OPTION_REG+0, 2
;microc_playground.c,42 :: 		Sound_Init(&PORTC, 2);
	MOVLW      PORTC+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      2
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;microc_playground.c,44 :: 		while (1)
L_main0:
;microc_playground.c,46 :: 		if (i > 250)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVF       _i+0, 0
	SUBLW      250
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;microc_playground.c,48 :: 		seconds++;
	INCF       _seconds+0, 1
	BTFSC      STATUS+0, 2
	INCF       _seconds+1, 1
;microc_playground.c,49 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;microc_playground.c,50 :: 		PORTA = 0b00000000;
	CLRF       PORTA+0
;microc_playground.c,51 :: 		Sound_Play(3000, 100);
	MOVLW      184
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      11
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      100
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;microc_playground.c,52 :: 		}
L_main2:
;microc_playground.c,54 :: 		if (seconds > 59)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _seconds+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVF       _seconds+0, 0
	SUBLW      59
L__main21:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;microc_playground.c,56 :: 		seconds = 0;
	CLRF       _seconds+0
	CLRF       _seconds+1
;microc_playground.c,57 :: 		minutes++;
	INCF       _minutes+0, 1
	BTFSC      STATUS+0, 2
	INCF       _minutes+1, 1
;microc_playground.c,58 :: 		}
L_main3:
;microc_playground.c,60 :: 		for (digit = 0; digit < 4; digit++)
	CLRF       _digit+0
	CLRF       _digit+1
L_main4:
	MOVLW      128
	XORWF      _digit+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      4
	SUBWF      _digit+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;microc_playground.c,62 :: 		PORTB = numbers[((digit < 2 ? 59 - seconds : 10 - minutes) / pow(10, digit < 2 ? digit : digit - 2)) % 10];
	MOVLW      128
	XORWF      _digit+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      2
	SUBWF      _digit+0, 0
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	MOVF       _seconds+0, 0
	SUBLW      59
	MOVWF      ?FLOC___mainT27+0
	MOVF       _seconds+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       ?FLOC___mainT27+1
	SUBWF      ?FLOC___mainT27+1, 1
	GOTO       L_main8
L_main7:
	MOVF       _minutes+0, 0
	SUBLW      10
	MOVWF      ?FLOC___mainT27+0
	MOVF       _minutes+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       ?FLOC___mainT27+1
	SUBWF      ?FLOC___mainT27+1, 1
L_main8:
	MOVLW      10
	MOVWF      FARG_pow_x+0
	MOVLW      0
	MOVWF      FARG_pow_x+1
	MOVLW      128
	XORWF      _digit+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      2
	SUBWF      _digit+0, 0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
	MOVF       _digit+0, 0
	MOVWF      ?FLOC___mainT30+0
	MOVF       _digit+1, 0
	MOVWF      ?FLOC___mainT30+1
	GOTO       L_main10
L_main9:
	MOVLW      2
	SUBWF      _digit+0, 0
	MOVWF      ?FLOC___mainT30+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _digit+1, 0
	MOVWF      ?FLOC___mainT30+1
L_main10:
	MOVF       ?FLOC___mainT30+0, 0
	MOVWF      FARG_pow_n+0
	MOVF       ?FLOC___mainT30+1, 0
	MOVWF      FARG_pow_n+1
	CALL       _pow+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       ?FLOC___mainT27+0, 0
	MOVWF      R0+0
	MOVF       ?FLOC___mainT27+1, 0
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
;microc_playground.c,63 :: 		if (digit == 2)
	MOVLW      0
	XORWF      _digit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      2
	XORWF      _digit+0, 0
L__main25:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;microc_playground.c,64 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
L_main11:
;microc_playground.c,65 :: 		PORTA = 0b00001000 >> digit;
	MOVF       _digit+0, 0
	MOVWF      R1+0
	MOVLW      8
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main26:
	BTFSC      STATUS+0, 2
	GOTO       L__main27
	RRF        R0+0, 1
	BCF        R0+0, 7
	BTFSC      R0+0, 6
	BSF        R0+0, 7
	ADDLW      255
	GOTO       L__main26
L__main27:
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;microc_playground.c,60 :: 		for (digit = 0; digit < 4; digit++)
	INCF       _digit+0, 1
	BTFSC      STATUS+0, 2
	INCF       _digit+1, 1
;microc_playground.c,66 :: 		}
	GOTO       L_main4
L_main5:
;microc_playground.c,68 :: 		if (seconds == 0 && minutes == 10)
	MOVLW      0
	XORWF      _seconds+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      0
	XORWF      _seconds+0, 0
L__main28:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	MOVLW      0
	XORWF      _minutes+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      10
	XORWF      _minutes+0, 0
L__main29:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
L__main18:
;microc_playground.c,69 :: 		break;
	GOTO       L_main1
L_main14:
;microc_playground.c,70 :: 		}
	GOTO       L_main0
L_main1:
;microc_playground.c,72 :: 		PORTA = 0b11111111;
	MOVLW      255
	MOVWF      PORTA+0
;microc_playground.c,73 :: 		PORTB = 0b11111111;
	MOVLW      255
	MOVWF      PORTB+0
;microc_playground.c,74 :: 		Sound_Play(3000, 5000);
	MOVLW      184
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      11
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      136
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      19
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;microc_playground.c,75 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_pow:

;microc_playground.c,77 :: 		int pow(int x, int n)
;microc_playground.c,80 :: 		int number = 1;
	MOVLW      1
	MOVWF      pow_number_L0+0
	MOVLW      0
	MOVWF      pow_number_L0+1
;microc_playground.c,82 :: 		for (i = 0; i < n; ++i)
	CLRF       pow_i_L0+0
	CLRF       pow_i_L0+1
L_pow15:
	MOVLW      128
	XORWF      pow_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_pow_n+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pow31
	MOVF       FARG_pow_n+0, 0
	SUBWF      pow_i_L0+0, 0
L__pow31:
	BTFSC      STATUS+0, 0
	GOTO       L_pow16
;microc_playground.c,83 :: 		number *= x;
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
;microc_playground.c,82 :: 		for (i = 0; i < n; ++i)
	INCF       pow_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       pow_i_L0+1, 1
;microc_playground.c,83 :: 		number *= x;
	GOTO       L_pow15
L_pow16:
;microc_playground.c,85 :: 		return (number);
	MOVF       pow_number_L0+0, 0
	MOVWF      R0+0
	MOVF       pow_number_L0+1, 0
	MOVWF      R0+1
;microc_playground.c,86 :: 		}
L_end_pow:
	RETURN
; end of _pow

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;microc_playground.c,88 :: 		void interrupt()
;microc_playground.c,90 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;microc_playground.c,91 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;microc_playground.c,92 :: 		}
L_end_interrupt:
L__interrupt33:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
