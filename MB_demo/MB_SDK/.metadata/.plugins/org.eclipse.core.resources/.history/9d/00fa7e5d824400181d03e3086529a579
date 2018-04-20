
#include "xparameters.h"
#include "xgpio.h"
#include "stdio.h"
#include "xil_types.h"

void delay_ms(u16 tnms)//不精确的延迟
{
	u16 n1,n2;
	for(n1=0; n1<2500; n1++)
		for(n2=0;n2<tnms;n2++);
}

int main()
{

	u8 i=0;
	u32 led;
	led=0x0000;
	XGpio_Out32(XPAR_LED8_BASEADDR,led);
	delay_ms(500);
	led=0xffff;
	XGpio_Out32(XPAR_LED8_BASEADDR,led);
	delay_ms(500);
	while(1)
	{
		i=0;
		led=0xFE;
		while(i<8)
		{
			XGpio_Out32(XPAR_LED8_BASEADDR,led);
			led<<=1;
			i++;
			delay_ms(100);
		}
	}
	return 0;
}
