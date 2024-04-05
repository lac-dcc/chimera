/*==========================================================
   module VIT_ENC.v

   Implements a (2,1,3) convolutional encoder

   John O'Shea, joshea@emc.com
============================================================*/

`timescale 1 ns/1 ns

module VIT_ENC (Vx,Ux,tb_en,clock,reset);

`include "params_b213.inc.v"

output [`n-1:0] Vx;
input  [`k-1:0] Ux;
input           tb_en;
input           clock;
input           reset;

reg [`m:0] encoder_reg;

always @(posedge clock or posedge reset)
   begin   
      if(reset)
         encoder_reg <= 4'b0;
      
      if (tb_en==1'b0)
         encoder_reg <= {Ux, encoder_reg[3:1]};
   end

assign Vx[1] = encoder_reg[3]^encoder_reg[1]^encoder_reg[0];
assign Vx[0] = encoder_reg[3]^encoder_reg[2]^encoder_reg[1]^encoder_reg[0];

endmodule 
