#line 1 "C:/Users/Deltagare/Documents/GitHub/microc_playground/microc_playground.c"
int pow(int x, int n);

int i = 0;
int j;
int numbers[10] = {
 0b11111100,
 0b01100000,
 0b11011010,
 0b11110010,
 0b01100110,
 0b10110110,
 0b10111110,
 0b11100000,
 0b11111110,
 0b11110110
};

void main()
{
 TRISA = 0b00000000;
 TRISB = 0b00000000;
 TRISC = 0b00000000;
 osccon = 0x77;
 ANSEL = 0b00000000;
 ANSELH = 0b00000000;

 INTCON.GIE = 1;
 INTCON.TMR0IE = 1;
 INTCON.TMR0IF = 0;

 OPTION_REG.T0CS = 0;
 OPTION_REG.PSA = 1;
 OPTION_REG.T0SE = 0;
 OPTION_REG.PS2 = 0;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 0;

 for (i = 1000; i > 0; i--)
 {
 for (j = 0; j < 4; j++)
 {
 PORTB = numbers[(i / pow(10, j)) % 10];
 if (j == 2)
 PORTB.F0 = 1;
 PORTA = 0b00001000 >> j;
 delay_ms(2);
 }
 }

 while (1)
 {
 for (j = 0; j < 4; j++)
 {
 PORTB = ~PORTA;
 PORTA = 0b00001000 >> j;
 delay_ms(2);
 }
 }
}

int pow(int x, int n)
{
 int i;
 int number = 1;

 for (i = 0; i < n; ++i)
 number *= x;

 return (number);
}
