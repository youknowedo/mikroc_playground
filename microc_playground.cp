#line 1 "C:/Users/Deltagare/Documents/GitHub/microc_playground/microc_playground.c"
int pow(int x, int n);

int i = 0;
int seconds = 59;
int minutes = 0;
int digit = 0;

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
 TRISA = 0b11110000;
 TRISB = 0b00000000;
 TRISC = 0b00000000;
 osccon = 0x77;
 ANSEL = 0b00000000;
 ANSELH = 0b00000000;

 INTCON.GIE = 1;
 INTCON.TMR0IE = 1;
 INTCON.TMR0IF = 0;

 OPTION_REG.T0SE = 1;
 OPTION_REG.T0CS = 0;
 OPTION_REG.PSA = 0;

 OPTION_REG.PS0 = 0;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS2 = 1;

 Sound_Init(&PORTC, 2);

 while (1)
 {
 if (i > 250)
 {
 seconds++;
 i = 0;
 PORTA = 0b00000000;
 Sound_Play(3000, 100);
 }

 if (seconds > 59)
 {
 seconds = 0;
 minutes++;
 }

 for (digit = 0; digit < 4; digit++)
 {
 PORTB = numbers[((digit < 2 ? 59 - seconds : 10 - minutes) / pow(10, digit < 2 ? digit : digit - 2)) % 10];
 if (digit == 2)
 PORTB.F0 = 1;
 PORTA = 0b00001000 >> digit;
 }

 if (seconds == 0 && minutes == 10)
 break;
 }

 PORTA = 0b11111111;
 PORTB = 0b11111111;
 Sound_Play(3000, 5000);
}

int pow(int x, int n)
{
 int i;
 int number = 1;

 for (i = 0; i < n; ++i)
 number *= x;

 return (number);
}

void interrupt()
{
 i++;
 INTCON.TMR0IF = 0;
}
