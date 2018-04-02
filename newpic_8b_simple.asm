#include <p18F4550.inc>
	
	CONFIG WDT=OFF; disable watchdog timer
	CONFIG MCLRE = ON; MCLEAR Pin on
	CONFIG DEBUG = ON; Enable Debug Mode
	CONFIG LVP = OFF; Low-Voltage programming disabled (necessary for debugging)
	CONFIG FOSC = INTOSCIO_EC;Internal oscillator, port function on RA6 
	
	org 0; start code at 0

UDATA
	
Delay1 res 1;reserve 1 byte for the variable Delay1
Delay2 res 1;reserve 1 byte for the variable Delay2

CODE

 Start:
    MOVLW  0xf7;
    MOVWF TRISD
Giro:
    
    MOVF PORTD, w
    MOVWF 0x00;
    RLCF WREG
    ANDWF 0x00, W
    RLCF WREG 
    IORWF 0x00, W 
    RLCF WREG 
    MOVWF PORTD 
    
    GOTO Giro
      end
	

    