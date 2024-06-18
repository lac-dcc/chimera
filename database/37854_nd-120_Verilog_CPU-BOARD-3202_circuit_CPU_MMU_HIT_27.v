// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/MMU/HIT                                                           **
** HIT DETECTOR                                                          **
** SHEET 27 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **
***************************************************************************/


module CPU_MMU_HIT_27( 
                       input [13:0] PPN_23_10_IN,
                       input [13:0] CPN_23_10_IN,                                                                     
                       input        LSHADOW,
                       input        FMISS,
                       input        CON_n,

                       output wire HIT0_n,
                       output wire HIT1_n
                     );


// Register to store the calculated HIT value
reg HIT0n_reg;
reg HIT1n_reg;


// Temporary signals for comparison
reg [7:0] PPN_HI;
reg [7:0] CPN_HI;


// HIT0 is false if PPN_23_10[7:0] == CPN_23_10[7:0]
always @(*) begin
   HIT0n_reg = (PPN_23_10_IN[7:0] == CPN_23_10_IN[7:0]) ? 1'b0 : 1'b1;
end


// HIT0 is true if PPN_23_10[5:0] != CPN_23_10[5:0] and LSHADOW is false
always @(*) begin
   // Construct PPN_HI
   PPN_HI[7:2] = PPN_23_10_IN[5:0];
   PPN_HI[1] = LSHADOW;
   PPN_HI[0] = 1'b0;
   
   // Construct CPN_HI
   CPN_HI[7:2] = CPN_23_10_IN[5:0];
   CPN_HI[1:0] = 2'b00; // Set both bits to 0

   HIT1n_reg = (PPN_HI == CPN_HI) ? 1'b0 : 1'b1;
end


assign HIT0_n = CON_n ? 1'b0 : HIT0n_reg;
assign HIT1_n = FMISS ? 1'b0 : HIT1n_reg;


endmodule
