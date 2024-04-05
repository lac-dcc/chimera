/*==========================================================
   module eACS_213.v

   ACS Block for (2,1,3) backward label decoder

============================================================*/

`timescale 1 ns/1 ns

module eACS_213 (acs_ppm_out, acs_Bx_out, 
                 acs_ppm_ina, HD_ina, acs_ppm_inb, HD_inb);


              
`include "params_e213.inc"

   output [`W-1:0] acs_ppm_out;
   output [`k-1:0] acs_Bx_out;
   
   input [`W-1:0]  acs_ppm_ina;
   input [`W-1:0]  acs_ppm_inb;   
   input [`W-1:0]  HD_ina;
   input [`W-1:0]  HD_inb;


   reg [`W-1:0]    acs_ppm_out;
   reg [`k-1:0]    acs_Bx_out;
   
   reg [`W-1:0]    suma;
   reg [`W-1:0]    sumb;   



always @(acs_ppm_ina or HD_ina)
   begin
      if (acs_ppm_ina==4'b1111)
         suma = acs_ppm_ina;
      else
         suma = acs_ppm_ina + HD_ina;
   end


     
         
always @(acs_ppm_inb or HD_inb)
   begin         
     if (acs_ppm_inb==4'b1111)
         sumb = acs_ppm_inb;
      else     
         sumb = acs_ppm_inb + HD_inb;

   end



always @(suma or sumb)
   begin 
      if (suma <=sumb)
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
