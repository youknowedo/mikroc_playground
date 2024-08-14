#line 1 "C:/Users/Deltagare/Documents/GitHub/microc_playground/microc_playground.c"
void init();
void waterfall();

int i = 0;

void main()
{
 init();

 PORTC = 0b00000001;
 delay_ms(75);

 while (1 == 1)
 waterfall();
}

void init()
{
 TRISA = 0b11111111;
 TRISB = 0b00000000;
 TRISC = 0b00000000;
 osccon = 0x77;
 ANSEL = 0b00000000;
 ANSELH = 0b00000000;
}

void waterfall()
{
 PORTC = 0b00000001;
 i = 0;
 while (i < 7)
 {
 PORTC = PORTC << 1;
 delay_ms(75);
 i++;
 }

 i = 0;
 while (i < 7)
 {
 PORTC = PORTC >> 1;
 delay_ms(75);
 i++;
 }
}
