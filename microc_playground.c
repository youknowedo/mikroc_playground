void knightRider();

int i = 0;

void main()
{
    TRISA = 0b11111111;
    TRISB = 0b00000000;
    TRISC = 0b00000000;
    osccon = 0x77;
    ANSEL = 0b00000000;
    ANSELH = 0b00000000;

    INTCON.GIE = 1;
    INTCON.INTE = 1;
    intcon.INTF = 0;

    PORTC = 0b00000001;
    delay_ms(75);

    while (1 == 1)
        knightRider();
}

void knightRider()
{
    PORTC = 0b00000001;
    PORTC.F0 = PORTA.F0 ? ~PORTC.F0 : PORTC.F0;
    i = 0;
    while (i < 14)
    {
        PORTC.F0 = PORTA.F0 ? ~PORTC.F0 : PORTC.F0;
        PORTC = i < 7 ? PORTC << 1 : PORTC >> 1;
        PORTC.F0 = PORTA.F0 ? ~PORTC.F0 : PORTC.F0;
        delay_ms(75);
        i++;
    }
}

void interrupt()
{
    while (!PORTA.F2);

    INTCON.INTF = 0;
}