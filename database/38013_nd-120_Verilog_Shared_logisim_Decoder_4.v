// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : Decoder_4                                                    **
 **                                                                          **
 *****************************************************************************/

module Decoder_4( decoderOut_0,
                  decoderOut_1,
                  decoderOut_2,
                  decoderOut_3,
                  enable,
                  sel );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       enable;
   input [1:0] sel;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output decoderOut_0;
   output decoderOut_1;
   output decoderOut_2;
   output decoderOut_3;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/
   assign decoderOut_0  = (enable&(sel == 2'b00)) ? 1'b1 : 1'b0;
   assign decoderOut_1  = (enable&(sel == 2'b01)) ? 1'b1 : 1'b0;
   assign decoderOut_2  = (enable&(sel == 2'b10)) ? 1'b1 : 1'b0;
   assign decoderOut_3  = (enable&(sel == 2'b11)) ? 1'b1 : 1'b0;
endmodule
