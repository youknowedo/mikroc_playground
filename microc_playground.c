void delay(int nTime);
void init();
void waterfall();
void waterfallReverse();

void main()
{
    init();

    while (1 == 1)
    {
        if (PORTA.F1)
            waterfall();
        else
            waterfallReverse();

        if (!PORTA.F2)
            continue;

        if (PORTA.F1)
            waterfallReverse();
        else
            waterfall();
    }
}

void delay(int nTime)
{
    while (nTime != 0)
    {
        nTime = nTime - 1;
    }
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
    PORTB = 0b00000001;
    delay(32767);
    PORTB = 0b00000010;
    delay(32767);
    PORTB = 0b00000100;
    delay(32767);
    PORTB = 0b00001000;
    delay(32767);
    PORTB = 0b00010000;
    delay(32767);
    PORTB = 0b00100000;
    delay(32767);
    PORTB = 0b01000000;
    delay(32767);
    PORTB = 0b10000000;
    delay(32767);
}
void waterfallReverse()
{
    PORTB = 0b10000000;
    delay(32767);
    PORTB = 0b01000000;
    delay(32767);
    PORTB = 0b00100000;
    delay(32767);
    PORTB = 0b00010000;
    delay(32767);
    PORTB = 0b00001000;
    delay(32767);
    PORTB = 0b00000100;
    delay(32767);
    PORTB = 0b00000010;
    delay(32767);
    PORTB = 0b00000001;
    delay(32767);
}