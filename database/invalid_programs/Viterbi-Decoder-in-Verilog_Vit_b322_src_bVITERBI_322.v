/*============================================================================
   module bVITERBI_322.v

   Top Level Module for the (3,2,2) backward label  Viterbi Decoder.

   This Module Contains:-
    - Branch Metric Unit (BMU)
    - Add Compare Select Unit (ACSU)
    - Metric and path Memory Units
    - Synchronization and Control Unit
   
   John O'Shea, jfoshea@gmail.com

===========================================================================*/


`timescale 1 ns/1 ns

module bVITERBI_322 (Dx,           // Decoded Output Symbol, Dx
                     oe,           // Dx output enable
                     sync_error,   // Sync error output signal
                     Rx,           // n-bit input Input bits
		     seq_ready,    // Next Sequence Ready to be decoded
                     clock,
                     reset);

`include "params_b322.inc"


   output [`k-1:0] Dx;
   output          oe;
   output          sync_error;
   
   input [`n-1:0]  Rx;
   input           seq_ready;
   input           reset;
   input           clock;
   

   wire [`W-1:0]   A0_out;
   wire [`W-1:0]   A1_out;   
   wire [`W-1:0]   A2_out;
   wire [`W-1:0]   A3_out;
   wire [`W-1:0]   A4_out;
   wire [`W-1:0]   A5_out;
   wire [`W-1:0]   A6_out;
   wire [`W-1:0]   A7_out;

   wire [`W-1:0]   acs0_ppm_out;
   wire [`W-1:0]   acs1_ppm_out;
   wire [`W-1:0]   acs2_ppm_out;
   wire [`W-1:0]   acs3_ppm_out;
   wire [`W-1:0]   acs4_ppm_out;
   wire [`W-1:0]   acs5_ppm_out;
   wire [`W-1:0]   acs6_ppm_out;
   wire [`W-1:0]   acs7_ppm_out;


   wire [`k-1:0]   acs0_Bx_out;
   wire [`k-1:0]   acs1_Bx_out;
   wire [`k-1:0]   acs2_Bx_out;
   wire [`k-1:0]   acs3_Bx_out;
   wire [`k-1:0]   acs4_Bx_out;
   wire [`k-1:0]   acs5_Bx_out;
   wire [`k-1:0]   acs6_Bx_out;   
   wire [`k-1:0]   acs7_Bx_out;   


   wire [1:0] 	   HD1;
   wire [1:0] 	   HD2;
   wire [1:0] 	   HD3;
   wire [1:0] 	   HD4;
   wire [1:0] 	   HD5;
   wire [1:0] 	   HD6;
   wire [1:0] 	   HD7;
   wire [1:0] 	   HD8;
   wire [1:0] 	   HD9;
   wire [1:0] 	   HD10;
   wire [1:0] 	   HD11;
   wire [1:0] 	   HD12;
   wire [1:0] 	   HD13;
   wire [1:0] 	   HD14;
   wire [1:0] 	   HD15;
   wire [1:0] 	   HD16;
   wire [1:0] 	   HD17;
   wire [1:0] 	   HD18;
   wire [1:0] 	   HD19;
   wire [1:0] 	   HD20;
   wire [1:0] 	   HD21;
   wire [1:0] 	   HD22;
   wire [1:0] 	   HD23;
   wire [1:0] 	   HD24;
   wire [1:0] 	   HD25;
   wire [1:0] 	   HD26;
   wire [1:0] 	   HD27;
   wire [1:0] 	   HD28;   
   wire [1:0] 	   HD29;
   wire [1:0] 	   HD30;
   wire [1:0] 	   HD31;
   wire [1:0] 	   HD32;

  

/*=== Instantiate the BMU === */
bBMU_322 U1 (.HD1(HD1),   .HD2(HD2),   .HD3(HD3),   .HD4(HD4),   
             .HD5(HD5),   .HD6(HD6),   .HD7(HD7),   .HD8(HD8),   
             .HD9(HD9),   .HD10(HD10), .HD11(HD11), .HD12(HD12), 
             .HD13(HD13), .HD14(HD14), .HD15(HD15), .HD16(HD16),
             .HD17(HD17), .HD18(HD18), .HD19(HD19), .HD20(HD20),
             .HD21(HD21), .HD22(HD22), .HD23(HD23), .HD24(HD24),
             .HD25(HD25), .HD26(HD26), .HD27(HD27), .HD28(HD28),
             .HD29(HD29), .HD30(HD30), .HD31(HD31), .HD32(HD32),              
             .Rx(Rx), .le(le), .reset(reset), .clock(clock)
            );



/*=== Instantiate ACSU ===*/
bACSU_322 U2 (.acs0_ppm_out(acs0_ppm_out), .acs1_ppm_out(acs1_ppm_out), 
              .acs2_ppm_out(acs2_ppm_out), .acs3_ppm_out(acs3_ppm_out), 
              .acs4_ppm_out(acs4_ppm_out), .acs5_ppm_out(acs5_ppm_out), 
              .acs6_ppm_out(acs6_ppm_out), .acs7_ppm_out(acs7_ppm_out),

              .acs0_Bx_out(acs0_Bx_out),   .acs1_Bx_out(acs1_Bx_out), 
              .acs2_Bx_out(acs2_Bx_out),   .acs3_Bx_out(acs3_Bx_out), 
              .acs4_Bx_out(acs4_Bx_out),   .acs5_Bx_out(acs5_Bx_out), 
              .acs6_Bx_out(acs6_Bx_out),   .acs7_Bx_out(acs7_Bx_out),

              .acs0_ppm_ina(A0_out), .HD0_ina(HD1), 
              .acs0_ppm_inb(A1_out), .HD0_inb(HD5),
              .acs0_ppm_inc(A4_out), .HD0_inc(HD17), 
              .acs0_ppm_ind(A5_out), .HD0_ind(HD21),              
              
              .acs1_ppm_ina(A0_out), .HD1_ina(HD2),  
              .acs1_ppm_inc(A4_out), .HD1_inb(HD6),
              .acs1_ppm_inb(A1_out), .HD1_inc(HD18),
              .acs1_ppm_ind(A5_out), .HD1_ind(HD22),
                            
              .acs2_ppm_ina(A0_out), .HD2_ina(HD3), 
              .acs2_ppm_inb(A1_out), .HD2_inb(HD7),
              .acs2_ppm_inc(A4_out), .HD2_inc(HD19),  
              .acs2_ppm_ind(A5_out), .HD2_ind(HD23),
                            
              .acs3_ppm_ina(A0_out), .HD3_ina(HD4), 
              .acs3_ppm_inb(A1_out), .HD3_inb(HD8),
              .acs3_ppm_inc(A4_out), .HD3_inc(HD20), 
              .acs3_ppm_ind(A5_out), .HD3_ind(HD24),              
              
              .acs4_ppm_ina(A2_out), .HD4_ina(HD9), 
              .acs4_ppm_inb(A3_out), .HD4_inb(HD13),
              .acs4_ppm_inc(A6_out), .HD4_inc(HD25), 
              .acs4_ppm_ind(A7_out), .HD4_ind(HD29),
                            
              .acs5_ppm_ina(A2_out), .HD5_ina(HD10), 
              .acs5_ppm_inb(A3_out), .HD5_inb(HD14),
              .acs5_ppm_inc(A6_out), .HD5_inc(HD26), 
              .acs5_ppm_ind(A7_out), .HD5_ind(HD30),              
              
              .acs6_ppm_ina(A2_out), .HD6_ina(HD11),  
              .acs6_ppm_inb(A3_out), .HD6_inb(HD15),
              .acs6_ppm_inc(A6_out), .HD6_inc(HD27), 
              .acs6_ppm_ind(A7_out), .HD6_ind(HD32),              
              
              .acs7_ppm_ina(A2_out), .HD7_ina(HD12), 
              .acs7_ppm_inb(A3_out), .HD7_inb(HD16),
              .acs7_ppm_inc(A6_out), .HD7_inc(HD28), 
              .acs7_ppm_ind(A7_out), .HD7_ind(HD32),
	      
              .ae(ae), .reset(reset), .clock(clock)
              );


/*=== Instantiate Control Unit  ===*/

bCONTROL_322 U3 (.Dx(Dx), .oe(oe), .le(le), .ae(ae), .sync_error(sync_error),
                 .A0_out(A0_out), .A1_out(A1_out), .A2_out(A2_out), .A3_out(A3_out), 
                 .A4_out(A4_out), .A5_out(A5_out), .A6_out(A6_out), .A7_out(A7_out),
                 
                 .A0_in(acs0_ppm_out), .A1_in(acs1_ppm_out), .A2_in(acs2_ppm_out), .A3_in(acs3_ppm_out),  
                 .A4_in(acs4_ppm_out), .A5_in(acs5_ppm_out), .A6_in(acs6_ppm_out), .A7_in(acs7_ppm_out),
                 
                 .P0_in(acs0_Bx_out), .P1_in(acs1_Bx_out), .P2_in(acs2_Bx_out), .P3_in(acs3_Bx_out), 
                 .P4_in(acs4_Bx_out), .P5_in(acs5_Bx_out), .P6_in(acs6_Bx_out), .P7_in(acs7_Bx_out),
		 .seq_ready(seq_ready), .reset(reset), .clock(clock)
                );


endmodule

