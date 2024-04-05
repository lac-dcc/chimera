/*==========================================================
   module eACS_213.v

   ACS Block for efficient (2,1,3) backward label decoder

   John O'Shea, joshea@emc.com

============================================================*/

`timescale 1 ns/1 ns

module eACS_213 (acs_ppm_out, acs_Bx_out, 
                 acs_ppm_ina, HD_ina, acs_ppm_inb, HD_inb,
                 ae, clock, reset);


              
`include "params_e213.inc.v"

   output [`W-1:0] acs_ppm_out;
   output [`k-1:0] acs_Bx_out;
   
   input [`W-1:0]  acs_ppm_ina;
   input [`W-1:0]  acs_ppm_inb;   
   input [1:0]  HD_ina;
   input [1:0]  HD_inb;
   input        ae;
   input        clock;
   input        reset;


   reg [`W-1:0]    acs_ppm_out;
   reg [`k-1:0]    acs_Bx_out;
   
   reg [`W-1:0]    suma;
   reg [`W-1:0]    sumb;   



always @(posedge clock or posedge reset)
   begin
      if (reset)
        suma <=0;
      else
	begin
           if (ae && acs_ppm_ina==4'b1111)
	     suma <= acs_ppm_ina;
           else if (ae)
             suma <= acs_ppm_ina + HD_ina;
	end
   end

always @(posedge clock or posedge reset)
   begin
      if (reset)
         sumb <=0;
      else
	begin
           if (ae && acs_ppm_inb ==4'b1111)
	     sumb <=acs_ppm_inb;
	   else if (ae)
             sumb <= acs_ppm_inb + HD_inb;
	end
   end

always @(suma or sumb)
   begin 
      if (suma <=sumb && ae)
         begin
            acs_ppm_out =suma;
            acs_Bx_out  =1'b0; //Select Upper Backward Path
         end
      else
         begin
            acs_ppm_out =sumb;
            acs_Bx_out  =1'b1; //Select Lower Backward Path
         end
   end
 
endmodule
