// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 DGA                                                             **
** DECODE/DGA/PFIFC/DELAY                                                **
**                                                                       **
** Page 13 DECODE - DECODE_DGA_PFIFC_DELAY Sheet 1 of 1                  **
**                                                                       **
** 7x F111. Switching speed avg 0.2 ns (min 0.1 -> max 0.3 ns) pr buffer **
** calculated delay = 7*0.2ns = 1.4 ns                                   **
**                                                                       **
** Last reviewed: 12-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/

/* NOT IN USE ANYMORE - REPLACED BY FIFO_8BIT.v
module DECODE_DGA_PFIFC_DELAY(
   input PIN_IN,
   output PIN_OUT 
);

   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet2;
   wire s_logisimNet3;
   wire s_logisimNet4;
   wire s_logisimNet5;
   wire s_logisimNet6;
   wire s_logisimNet7;

   assign s_logisimNet6 = PIN_IN;

   assign s_logisimNet7 = s_logisimNet6;
   assign s_logisimNet4 = s_logisimNet7;
   assign s_logisimNet5 = s_logisimNet4;
   assign s_logisimNet2 = s_logisimNet5;
   assign s_logisimNet3 = s_logisimNet2;
   assign s_logisimNet0 = s_logisimNet3;
   assign s_logisimNet1 = s_logisimNet0;

   assign PIN_OUT = s_logisimNet1;

endmodule
*/