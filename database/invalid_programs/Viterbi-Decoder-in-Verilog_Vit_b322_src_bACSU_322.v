/*============================================================================
   module bACSU_322.v

   Add-Compare-Select Unit for (3,2,2) trellis stage.
   Comprises of 2^M ACS Blocks

===========================================================================*/
`timescale 1 ns/1 ns

module bACSU_322(acs0_ppm_out, acs1_ppm_out, acs2_ppm_out, acs3_ppm_out, 
                 acs4_ppm_out, acs5_ppm_out, acs6_ppm_out, acs7_ppm_out,

                 acs0_Bx_out,  acs1_Bx_out,  acs2_Bx_out,  acs3_Bx_out, 
                 acs4_Bx_out,  acs5_Bx_out,  acs6_Bx_out,  acs7_Bx_out,

                 acs0_ppm_ina,  acs0_ppm_inb, acs0_ppm_inc, acs0_ppm_ind, HD0_ina, HD0_inb, HD0_inc, HD0_ind,
                 acs1_ppm_ina,  acs1_ppm_inb, acs1_ppm_inc, acs1_ppm_ind, HD1_ina, HD1_inb, HD1_inc, HD1_ind,
                 acs2_ppm_ina,  acs2_ppm_inb, acs2_ppm_inc, acs2_ppm_ind, HD2_ina, HD2_inb, HD2_inc, HD2_ind,
                 acs3_ppm_ina,  acs3_ppm_inb, acs3_ppm_inc, acs3_ppm_ind, HD3_ina, HD3_inb, HD3_inc, HD3_ind,
                 acs4_ppm_ina,  acs4_ppm_inb, acs4_ppm_inc, acs4_ppm_ind, HD4_ina, HD4_inb, HD4_inc, HD4_ind,
                 acs5_ppm_ina,  acs5_ppm_inb, acs5_ppm_inc, acs5_ppm_ind, HD5_ina, HD5_inb, HD5_inc, HD5_ind,
                 acs6_ppm_ina,  acs6_ppm_inb, acs6_ppm_inc, acs6_ppm_ind, HD6_ina, HD6_inb, HD6_inc, HD6_ind,
                 acs7_ppm_ina,  acs7_ppm_inb, acs7_ppm_inc, acs7_ppm_ind, HD7_ina, HD7_inb, HD7_inc, HD7_ind,
		 ae, reset, clock

                );





`include "params_b322.inc"

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


   input [`W-1:0]  acs0_ppm_inc;
   input [`W-1:0]  acs1_ppm_inc;
   input [`W-1:0]  acs2_ppm_inc;
   input [`W-1:0]  acs3_ppm_inc;
   input [`W-1:0]  acs4_ppm_inc;
   input [`W-1:0]  acs5_ppm_inc;
   input [`W-1:0]  acs6_ppm_inc;
   input [`W-1:0]  acs7_ppm_inc;   
   

   input [`W-1:0]  acs0_ppm_ind;
   input [`W-1:0]  acs1_ppm_ind;
   input [`W-1:0]  acs2_ppm_ind;
   input [`W-1:0]  acs3_ppm_ind;
   input [`W-1:0]  acs4_ppm_ind;
   input [`W-1:0]  acs5_ppm_ind;
   input [`W-1:0]  acs6_ppm_ind;
   input [`W-1:0]  acs7_ppm_ind;   


   input [1:0] 	   HD0_ina;
   input [1:0] 	   HD0_inb;
   input [1:0] 	   HD0_inc;
   input [1:0] 	   HD0_ind;   


   input [1:0] 	   HD1_ina;
   input [1:0] 	   HD1_inb;
   input [1:0] 	   HD1_inc;
   input [1:0] 	   HD1_ind;   

   input [1:0] 	   HD2_ina;
   input [1:0] 	   HD2_inb;
   input [1:0] 	   HD2_inc;
   input [1:0] 	   HD2_ind;      

   input [1:0] 	   HD3_ina;
   input [1:0] 	   HD3_inb;
   input [1:0] 	   HD3_inc;
   input [1:0] 	   HD3_ind;   

   input [1:0] 	   HD4_ina;
   input [1:0] 	   HD4_inb;
   input [1:0] 	   HD4_inc;
   input [1:0] 	   HD4_ind;   
   
   input [1:0] 	   HD5_ina;
   input [1:0] 	   HD5_inb;
   input [1:0] 	   HD5_inc;
   input [1:0] 	   HD5_ind;   


   input [1:0] 	   HD6_ina;
   input [1:0] 	   HD6_inb;
   input [1:0] 	   HD6_inc;
   input [1:0] 	   HD6_ind;   

   input [1:0] 	   HD7_ina;
   input [1:0] 	   HD7_inb;
   input [1:0] 	   HD7_inc;
   input [1:0] 	   HD7_ind;

   input 	   ae;
   input 	   reset;
   input 	   clock;
   



/*=== ACS State 0 ===*/
bACS_322 ACS0 (.acs_ppm_out(acs0_ppm_out), 
               .acs_Bx_out(acs0_Bx_out),
               
               .acs_ppm_ina(acs0_ppm_ina), 
               .HD_ina({2'b0,HD0_ina}), 
               
               .acs_ppm_inb(acs0_ppm_inb), 
               .HD_inb({2'b0,HD0_inb}),
               
               .acs_ppm_inc(acs0_ppm_inc), 
               .HD_inc({2'b0,HD0_inc}), 
               
               .acs_ppm_ind(acs0_ppm_ind), 
               .HD_ind({2'b0,HD0_ind}),
	       
	       .ae(ae),
	       .reset(reset),
	       .clock(clock)
              );

/*=== ACS State 1 ===*/
bACS_322 ACS1 (.acs_ppm_out(acs1_ppm_out),
               .acs_Bx_out(acs1_Bx_out), 
               
               .acs_ppm_ina(acs1_ppm_ina), 
               .HD_ina({2'b0,HD1_ina}), 
               
               .acs_ppm_inb(acs1_ppm_inb), 
               .HD_inb({2'b0,HD1_inb}),
               
               .acs_ppm_inc(acs1_ppm_inc), 
               .HD_inc({2'b0,HD1_inc}), 
               
               .acs_ppm_ind(acs1_ppm_ind), 
               .HD_ind({2'b0,HD1_ind}),

	       .ae(ae),
	       .reset(reset),
	       .clock(clock)
              );

/*=== ACS State 2 ===*/
bACS_322 ACS2 (.acs_ppm_out(acs2_ppm_out), 
               .acs_Bx_out(acs2_Bx_out), 
               
               .acs_ppm_ina(acs2_ppm_ina), 
               .HD_ina({2'b0,HD2_ina}), 
               
               .acs_ppm_inb(acs2_ppm_inb), 
               .HD_inb({2'b0,HD2_inb}),
               
               .acs_ppm_inc(acs2_ppm_inc), 
               .HD_inc({2'b0,HD2_inc}), 
               
               .acs_ppm_ind(acs2_ppm_ind), 
               .HD_ind({2'b0,HD2_ind}),

	       .ae(ae),
	       .reset(reset),
	       .clock(clock)
              );


/*=== ACS State 3 ===*/
bACS_322 ACS3 (.acs_ppm_out(acs3_ppm_out), 
               .acs_Bx_out(acs3_Bx_out), 
               
               .acs_ppm_ina(acs3_ppm_ina), 
               .HD_ina({2'b0,HD3_ina}), 
               
               .acs_ppm_inb(acs3_ppm_inb), 
               .HD_inb({2'b0,HD3_inb}),
               
               .acs_ppm_inc(acs3_ppm_inc), 
               .HD_inc({2'b0,HD3_inc}), 
               
               .acs_ppm_ind(acs3_ppm_ind), 
               .HD_ind({2'b0,HD3_ind}),

	       .ae(ae),
	       .reset(reset),
	       .clock(clock)
              );


/*=== ACS State 4 ===*/
bACS_322 ACS4 (.acs_ppm_out(acs4_ppm_out), 
               .acs_Bx_out(acs4_Bx_out), 
               
               .acs_ppm_ina(acs4_ppm_ina), 
               .HD_ina({2'b0,HD4_ina}), 
               
               .acs_ppm_inb(acs4_ppm_inb), 
               .HD_inb({2'b0,HD4_inb}),
               
               .acs_ppm_inc(acs4_ppm_inc), 
               .HD_inc({2'b0,HD4_inc}), 
               
               .acs_ppm_ind(acs4_ppm_ind), 
               .HD_ind({2'b0,HD4_ind}),

	       .ae(ae),
	       .reset(reset),
	       .clock(clock)
              );


/*=== ACS State 5 ===*/
bACS_322 ACS5 (.acs_ppm_out(acs5_ppm_out), 
               .acs_Bx_out(acs5_Bx_out), 
               
               .acs_ppm_ina(acs5_ppm_ina), 
               .HD_ina({2'b0,HD5_ina}), 
               
               .acs_ppm_inb(acs5_ppm_inb), 
               .HD_inb({2'b0,HD5_inb}),
               
               .acs_ppm_inc(acs5_ppm_inc), 
               .HD_inc({2'b0,HD5_inc}), 
               
               .acs_ppm_ind(acs5_ppm_ind), 
               .HD_ind({2'b0,HD5_ind}),

	       .ae(ae),
	       .reset(reset),
	       .clock(clock)
               );

/*=== ACS State 6 ===*/
bACS_322 ACS6 (.acs_ppm_out(acs6_ppm_out), 
               .acs_Bx_out(acs6_Bx_out), 
               
               .acs_ppm_ina(acs6_ppm_ina), 
               .HD_ina({2'b0,HD6_ina}), 
               
               .acs_ppm_inb(acs6_ppm_inb), 
               .HD_inb({2'b0,HD6_inb}),
               
               .acs_ppm_inc(acs6_ppm_inc), 
               .HD_inc({2'b0,HD6_inc}), 
               
               .acs_ppm_ind(acs6_ppm_ind), 
               .HD_ind({2'b0,HD6_ind}),

	       .ae(ae),
	       .reset(reset),
	       .clock(clock)
              );

/*=== ACS State 7 ===*/
bACS_322 ACS7 (.acs_ppm_out(acs7_ppm_out), 
               .acs_Bx_out(acs7_Bx_out), 
               
               .acs_ppm_ina(acs7_ppm_ina), 
               .HD_ina({2'b0,HD7_ina}), 
               
               .acs_ppm_inb(acs7_ppm_inb), 
               .HD_inb({2'b0,HD7_inb}),
               
               .acs_ppm_inc(acs7_ppm_inc), 
               .HD_inc({2'b0,HD7_inc}), 
               
               .acs_ppm_ind(acs7_ppm_ind), 
               .HD_ind({2'b0,HD7_ind}),

	       .ae(ae),
	       .reset(reset),
	       .clock(clock)
              );


endmodule 
