/*==========================================================
   module eACS_322.v

   ACS Block for efficient (3,2,2) backward label decoder

============================================================*/

`timescale 1 ns/1 ns

module eACS_322 (acs_ppm_out, acs_Bx_out,
                 acs_ppm_ina, HD_ina, acs_ppm_inb, HD_inb, 
                 acs_ppm_inc, HD_inc, acs_ppm_ind, HD_ind,
                 ae, reset, clock);


              
`include "params_e322.inc"

   output [`W-1:0] acs_ppm_out;
   output [`k-1:0] acs_Bx_out;
   
   input [`W-1:0]  acs_ppm_ina;
   input [`W-1:0]  acs_ppm_inb;
   input [`W-1:0]  acs_ppm_inc;
   input [`W-1:0]  acs_ppm_ind;

   input [`W-1:0]  HD_ina;
   input [`W-1:0]  HD_inb;
   input [`W-1:0]  HD_inc;
   input [`W-1:0]  HD_ind;
   input 	   ae;
   input 	   reset;
   input 	   clock;
   
   
   reg [`W-1:0]    acs_ppm_out;
   reg [`W-1:0]    acs_ppm_ab;   
   reg [`W-1:0]    acs_ppm_cd;   


   reg [`k-1:0]    acs_Bx_out;
   reg [`k-1:0]    acs_Bx_ab;   
   reg [`k-1:0]    acs_Bx_cd;   


   reg [`W-1:0]    suma;
   reg [`W-1:0]    sumb;
   reg [`W-1:0]    sumc;
   reg [`W-1:0]    sumd;   



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
          if (ae && acs_ppm_inb==4'b1111)
            sumb <= acs_ppm_inb;
	  else if (ae)
            sumb <= acs_ppm_inb + HD_inb;
       end
  end
   
always @(posedge clock or posedge reset)
  begin
     if (reset)
       sumc <=0;
     else
       begin
          if (ae && acs_ppm_inc==4'b1111)
            sumc <= acs_ppm_inc;
	  else if (ae)
            sumc <= acs_ppm_inc + HD_inc;
       end
  end


always @(posedge clock or posedge reset)
  begin
     if (reset)
       sumd <=0;
     else
       begin
          if (ae && acs_ppm_ind==4'b1111)
            sumd <= acs_ppm_ind;
	  else if (ae)
            sumd <= acs_ppm_ind + HD_ind;
       end
  end
   


always @(suma or sumb or sumc or sumd)
   begin 
      if (suma <=sumb)
         begin
            acs_ppm_ab =suma;
            acs_Bx_ab  =2'b00;
         end
      else
         begin
            acs_ppm_ab =sumb;
            acs_Bx_ab  =2'b01;
         end
      if (sumc <=sumd)
         begin
            acs_ppm_cd =sumc;
            acs_Bx_cd  =2'b10;
         end
      else
         begin      
            acs_ppm_cd =sumd;
            acs_Bx_cd  =2'b11;
         end
   end
   


always @(acs_ppm_ab or acs_ppm_cd)
   begin
      if (acs_ppm_ab <= acs_ppm_cd)
         begin
            acs_ppm_out = acs_ppm_ab;
            acs_Bx_out  = acs_Bx_ab;
         end
      else
         begin
            acs_ppm_out = acs_ppm_cd;
            acs_Bx_out  = acs_Bx_cd;
         end
   end
   
 
endmodule
