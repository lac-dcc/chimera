/*=========================================================
   module ENCODER_322.v

   Implements a (3,2,2) convolutional encoder

   Generator Matrix g=[110;010;010;101;100;101]

   John O'Shea, jfoshea@gmail.com

============================================================*/

`timescale 1 ns/1 ns

module ENCODER_322 (Vx,Ux,tb_en,clock,reset);

   output [2:0] Vx;
	     
   input [1:0] 	Ux;
   input        tb_en;
   input        clock;
   input        reset;

   reg 	[1:0]	enc_reg_s11;
   reg 	[2:0]	enc_reg_s21s22;
   

always @(posedge clock or posedge reset)
  begin
     if(reset)
       begin
	  enc_reg_s11    <=0;
	  enc_reg_s21s22 <=0;
       end
     else
       begin
          if (!tb_en)
             begin
                enc_reg_s11    <={Ux[0], enc_reg_s11[1]};
                enc_reg_s21s22 <={Ux[1], enc_reg_s21s22[2:1]};
	     end
       end
   end

   assign Vx[0] = enc_reg_s11[1] ^ enc_reg_s21s22[1] ^ enc_reg_s11[0];
   assign Vx[1] = enc_reg_s11[0] ^ enc_reg_s21s22[2] ^ enc_reg_s21s22[0];
   assign Vx[2] = enc_reg_s11[1] ^ enc_reg_s21s22[0] ^ enc_reg_s21s22[2];
   
endmodule 
