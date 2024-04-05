/*============================================================================
   module bACSU_213.v

   Add-Compare-Select Unit for (2,1,3) trellis stage.
   Comprises of 2^M ACS Blocks

===========================================================================*/
`timescale 1 ns/1 ns

module bACSU_213(acs0_ppm_out, acs1_ppm_out, acs2_ppm_out, acs3_ppm_out, 
                 acs4_ppm_out, acs5_ppm_out, acs6_ppm_out, acs7_ppm_out,

                 acs0_Bx_out,  acs1_Bx_out,  acs2_Bx_out,  acs3_Bx_out, 
                 acs4_Bx_out,  acs5_Bx_out,  acs6_Bx_out,  acs7_Bx_out,

                 acs0_ppm_ina,  acs0_ppm_inb, HD0_ina, HD0_inb,
                 acs1_ppm_ina,  acs1_ppm_inb, HD1_ina, HD1_inb,
                 acs2_ppm_ina,  acs2_ppm_inb, HD2_ina, HD2_inb,
                 acs3_ppm_ina,  acs3_ppm_inb, HD3_ina, HD3_inb,
                 acs4_ppm_ina,  acs4_ppm_inb, HD4_ina, HD4_inb,
                 acs5_ppm_ina,  acs5_ppm_inb, HD5_ina, HD5_inb,
                 acs6_ppm_ina,  acs6_ppm_inb, HD6_ina, HD6_inb,
                 acs7_ppm_ina,  acs7_ppm_inb, HD7_ina, HD7_inb,
                 ae, clock, reset
                );





`include "params_b213.inc.v"

   output [`W-1:0] acs0_ppm_out;
   output [`W-1:0] acs1_ppm_out;
   output [`W-1:0] acs2_ppm_out;
   output [`W-1:0] acs3_ppm_out;
   output [`W-1:0] acs4_ppm_out;
   output [`W-1:0] acs5_ppm_out;
   output [`W-1:0] acs6_ppm_out;
   output [`W-1:0] acs7_ppm_out;

   output [`k-1:0] acs0_Bx_out;
   output [`k-1:0] acs1_Bx_out;
   output [`k-1:0] acs2_Bx_out;
   output [`k-1:0] acs3_Bx_out;
   output [`k-1:0] acs4_Bx_out;
   output [`k-1:0] acs5_Bx_out;
   output [`k-1:0] acs6_Bx_out;
   output [`k-1:0] acs7_Bx_out;



   input [`W-1:0]  acs0_ppm_ina;
   input [`W-1:0]  acs1_ppm_ina;
   input [`W-1:0]  acs2_ppm_ina;
   input [`W-1:0]  acs3_ppm_ina;
   input [`W-1:0]  acs4_ppm_ina;
   input [`W-1:0]  acs5_ppm_ina;
   input [`W-1:0]  acs6_ppm_ina;
   input [`W-1:0]  acs7_ppm_ina;
   
   input [`W-1:0]  acs0_ppm_inb;
   input [`W-1:0]  acs1_ppm_inb;
   input [`W-1:0]  acs2_ppm_inb;
   input [`W-1:0]  acs3_ppm_inb;
   input [`W-1:0]  acs4_ppm_inb;
   input [`W-1:0]  acs5_ppm_inb;
   input [`W-1:0]  acs6_ppm_inb;
   input [`W-1:0]  acs7_ppm_inb;


   input [1:0] 	   HD0_ina;
   input [1:0] 	   HD1_ina;
   input [1:0] 	   HD2_ina;
   input [1:0] 	   HD3_ina;
   input [1:0] 	   HD4_ina;
   input [1:0] 	   HD5_ina;
   input [1:0] 	   HD6_ina;
   input [1:0] 	   HD7_ina;
   
   input [1:0] 	   HD0_inb;
   input [1:0] 	   HD1_inb;
   input [1:0] 	   HD2_inb;
   input [1:0] 	   HD3_inb;
   input [1:0] 	   HD4_inb;
   input [1:0] 	   HD5_inb;
   input [1:0] 	   HD6_inb;
   input [1:0] 	   HD7_inb;   
   
   input ae;
   input clock;
   input reset;

/*=== ACS State 0 ===*/
bACS_213 ACS0 (.acs_ppm_out(acs0_ppm_out), 
               .acs_Bx_out(acs0_Bx_out),
               
               .acs_ppm_ina(acs0_ppm_ina), 
               .HD_ina(HD0_ina), 
               
               .acs_ppm_inb(acs0_ppm_inb), 
               .HD_inb(HD0_inb),

               .ae(ae),
               .clock(clock),
               .reset(reset)
              );

/*=== ACS State 1 ===*/
bACS_213 ACS1 (.acs_ppm_out(acs1_ppm_out),
               .acs_Bx_out(acs1_Bx_out), 
               
               .acs_ppm_ina(acs1_ppm_ina), 
               .HD_ina(HD1_ina), 
               
               .acs_ppm_inb(acs1_ppm_inb), 
               .HD_inb(HD1_inb),

               .ae(ae),
               .clock(clock),
               .reset(reset)
              );

/*=== ACS State 2 ===*/
bACS_213 ACS2 (.acs_ppm_out(acs2_ppm_out), 
               .acs_Bx_out(acs2_Bx_out),
                
               .acs_ppm_ina(acs2_ppm_ina), 
               .HD_ina(HD2_ina),
                
               .acs_ppm_inb(acs2_ppm_inb), 
               .HD_inb(HD2_inb),

               .ae(ae),
               .clock(clock),
               .reset(reset)
              );


/*=== ACS State 3 ===*/
bACS_213 ACS3 (.acs_ppm_out(acs3_ppm_out), 
               .acs_Bx_out(acs3_Bx_out),
                
               .acs_ppm_ina(acs3_ppm_ina), 
               .HD_ina(HD3_ina),
                
               .acs_ppm_inb(acs3_ppm_inb), 
               .HD_inb(HD3_inb),

               .ae(ae),
               .clock(clock),
               .reset(reset)
              );


/*=== ACS State 4 ===*/
bACS_213 ACS4 (.acs_ppm_out(acs4_ppm_out), 
               .acs_Bx_out(acs4_Bx_out),
                
               .acs_ppm_ina(acs4_ppm_ina), 
               .HD_ina(HD4_ina),
                
               .acs_ppm_inb(acs4_ppm_inb), 
               .HD_inb(HD4_inb),

               .ae(ae),
               .clock(clock),
               .reset(reset)
              );


/*=== ACS State 5 ===*/
bACS_213 ACS5 (.acs_ppm_out(acs5_ppm_out), 
               .acs_Bx_out(acs5_Bx_out),
                
               .acs_ppm_ina(acs5_ppm_ina), 
               .HD_ina(HD5_ina),
                
               .acs_ppm_inb(acs5_ppm_inb), 
               .HD_inb(HD5_inb),               

               .ae(ae),
               .clock(clock),
               .reset(reset)
               );

/*=== ACS State 6 ===*/
bACS_213 ACS6 (.acs_ppm_out(acs6_ppm_out), 
               .acs_Bx_out(acs6_Bx_out),
                
               .acs_ppm_ina(acs6_ppm_ina), 
               .HD_ina(HD6_ina),
                
               .acs_ppm_inb(acs6_ppm_inb), 
               .HD_inb(HD6_inb),

               .ae(ae),
               .clock(clock),
               .reset(reset)
              );

/*=== ACS State 7 ===*/
bACS_213 ACS7 (.acs_ppm_out(acs7_ppm_out), 
               .acs_Bx_out(acs7_Bx_out),
                
               .acs_ppm_ina(acs7_ppm_ina), 
               .HD_ina(HD7_ina),
                
               .acs_ppm_inb(acs7_ppm_inb), 
               .HD_inb(HD7_inb),

               .ae(ae),
               .clock(clock),
               .reset(reset)
              );


endmodule 
