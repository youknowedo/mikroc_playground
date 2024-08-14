void delay(int nTime);

void main()
{
    int nTime;
    TRISA = 0b11111111;
    TRISB = 0b00000000;
    TRISC = 0b00000000;
    osccon = 0x77;
    ANSEL = 0b00000000;
    ANSELH = 0b00000000;

    while (1 == 1)
    {
        PORTB = 0b00000000;
        PORTB = 0b00000001;
        nTime = 32767;
        delay(32767);
        PORTB = 0b00000010;
        nTime = 32767;
        delay(32767);
        PORTB = 0b00000100;
        nTime = 32767;
        delay(32767);
        PORTB = 0b00001000;
        nTime = 32767;
        delay(32767);
        PORTB = 0b00010000;
        nTime = 32767;
        delay(32767);
        PORTB = 0b00100000;
        nTime = 32767;
        delay(32767);
        PORTB = 0b01000000;
        nTime = 32767;
        delay(32767);
        PORTB = 0b10000000;
        nTime = 32767;
        delay(32767);
    }
}

void delay(int nTime)
{
    while (nTime != 0)
    {
        nTime = nTime - 1;
    }
}