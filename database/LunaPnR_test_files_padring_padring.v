// This program was cloned from: https://github.com/asicsforthemasses/LunaPnR
// License: GNU General Public License v3.0

module top();

PADFC c_ul ();
PADFC c_ur ();
PADFC c_ll ();
PADFC c_lr ();

PADINOUT \GPIO[0] ();
PADINOUT \GPIO[1] ();
PADINOUT \GPIO[2] ();
PADINOUT \GPIO[3] ();
PADINOUT \GPIO[4] ();
PADINOUT \GPIO[5] ();
PADINOUT \GPIO[6] ();
PADINOUT \GPIO[7] ();

PADINC CLK ();
PADINC RESET ();
PADINC MISO ();
PADOUT MOSI ();
PADINC SCK ();
PADINC SPI_CS_N ();
PADOUT UART_TX ();
PADINC UART_RX ();

PADOUT PWM_1 ();
PADOUT PWM_2 ();
PADVDD VDD_1 ();
PADGND GND_1 ();
PADOUT PWM_3 ();
PADOUT PWM_4 ();

PADOUT DAC_0 ();
PADOUT DAC_1 ();
PADVDD VDD_2 ();
PADGND GND_2 ();
PADOUT DAC_2 ();
PADOUT DAC_3 ();

endmodule
