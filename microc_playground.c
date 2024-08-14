void init();
void knightRider();

int i = 0;

void main()
{
    init();

    PORTC = 0b00000001;
    delay_ms(75);

    while (1 == 1)
        knightRider();
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

void knightRider()
{
    PORTC = 0b00000001;
    PORTC.F0 = ~PORTC.F0;
    i = 0;
    while (i < 14)
    {
        PORTC.F0 = ~PORTC.F0;
        PORTC = i < 7 ? PORTC << 1 : PORTC >> 1;
        PORTC.F0 = ~PORTC.F0;
        delay_ms(75);
        i++;
    }
}