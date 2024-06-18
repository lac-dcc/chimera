// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R8
// ADGD/13/8/86
// 44803A,5F,RAMA

//  RAM ARBITER

// PAL16R8 FAMILY
// PAL16R8 has 8 flip-flips, 8 inputs and 8 outputs (negated from flip-flops with 3-state support)

// https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf



// PCB 3202D sheet 50:
//
// PAL input signal PD1 is connected to PAL OE_n pin
//     input signal OSC is connectec to PAL CK pin

module PAL_44803A(
    input CK,           // Clock signal
    input OE_n,         // OUTPUT ENABLE (active-low) for Q0-Q5

    input LOEN_n,       // I0 - LOEN_n
    input RLRQ_n,       // I1 - RLRQ_n
    input MR_n,         // I2 - MR_n 
    input CLRQ_n,       // I3 - CLRQ_n 
    input BLRQ50_n,     // I4 - BLRQ50_n 
    input SSEMA_n,      // I5 - SSEMA_n
    input SEMRQ50_n,    // I6 - SEMRQ50_n
//  input n.c ,         // I7 - n.c.

    output RGNT_n,      // Q0_n - RGNT_n
    output CGNT_n,      // Q1_n - CGNT_n
    output BGNT_n,      // Q2_n - BGNT_n
    output LOEN25_n,    // Q3_n - LOEN25_n (n.c.)
    output LDR_n,       // Q4_n - LDR_n (n.c.)
    output CSEM_n,      // Q5_n - CSEM_n (n.c.)
    output BSEM_n,      // Q6_n - BSEM_n (n.c.)
    output BCGNT25      // Q7_n - BCGNT25
);

// negated input signals
wire LOEN     = ~LOEN_n;   
wire RLRQ     = ~RLRQ_n;   
wire CLRQ     = ~CLRQ_n;
wire BLRQ50   = ~BLRQ50_n;
wire SSEMA    = ~SSEMA_n; 
wire SEMRQ50  = ~SEMRQ50_n;


// Register signals as wires (to help with the equations)
wire RGNT =  RGNT_reg;
wire CGNT =  CGNT_reg; 
wire BGNT =  BGNT_reg;
wire LDR =  LDR_reg;
wire CSEM =  CSEM_reg;
wire BSEM =  BSEM_reg;
wire LOEN25 =  LOEN25_reg;


// Internal registers
reg RGNT_reg;
reg CGNT_reg; 
reg BGNT_reg;
reg LDR_reg;
reg CSEM_reg;
reg BSEM_reg;
reg LOEN25_reg;
reg BCGNT25_n_reg;



//**** Sequential logic triggered on the rising edge of CLK ****
always @(posedge CK) begin       

    RGNT_reg <=   (RLRQ & CSEM_n & BSEM_n & RGNT_n & CGNT_n & BGNT_n)
                | (RGNT & LOEN_n & LOEN25_n)
                | (RGNT & LOEN & LOEN25)
                | (RGNT & LOEN & LOEN25_n);

    CGNT_reg <=   (MR_n & CSEM_n & BSEM_n & CLRQ & BLRQ50_n & RLRQ_n & RGNT_n & CGNT_n & BGNT_n)
                | (MR_n & CSEM_n & BSEM_n & LDR & RLRQ_n & CLRQ & RGNT_n & CGNT_n & BGNT_n)
                | (MR_n & CSEM & BSEM_n & CLRQ & RGNT_n & CGNT_n & BGNT_n)
                | (CGNT & LOEN_n & LOEN25_n & MR_n)
                | (CGNT & LOEN & LOEN25 & MR_n)
                | (CGNT & LOEN & LOEN25_n & MR_n);

    BGNT_reg <=   (MR_n & CSEM_n & BSEM_n & RLRQ_n & CLRQ_n & BLRQ50 & RGNT_n & CGNT_n & BGNT_n)
                | (MR_n & CSEM_n & BSEM_n & LDR_n & RLRQ_n & BLRQ50 & RGNT_n & CGNT_n & BGNT_n)
                | (MR_n & CSEM_n & BSEM & BLRQ50 & RGNT_n & CGNT_n & BGNT_n)
                | (BGNT & LOEN_n & LOEN25_n & MR_n)
                | (BGNT & LOEN & LOEN25 & MR_n)
                | (BGNT & LOEN & LOEN25_n & MR_n);

    LDR_reg <=    RGNT
               | (LDR & CGNT_n & BGNT_n);

    CSEM_reg <=   (MR_n & SSEMA & CGNT)
                | (MR_n & CSEM & LOEN25 & LOEN)
                | (MR_n & CSEM & LOEN25 & LOEN_n)
                | (MR_n & CSEM & LOEN25_n & LOEN_n);

    BSEM_reg <=   (MR_n & SEMRQ50 & BGNT)
                | (MR_n & BSEM & LOEN25 & LOEN)
                | (MR_n & BSEM & LOEN25 & LOEN_n)
                | (MR_n & BSEM & LOEN25_n & LOEN_n);

    LOEN25_reg <= LOEN;

    BCGNT25_n_reg <= BGNT_n & CGNT_n;

end

// Tri-state control for Q outputs
// Assigning outputs with three-state logic controlled by OE_n

assign RGNT_n   = OE_n ? 1'b0 : ~RGNT_reg;      
assign CGNT_n   = OE_n ? 1'b0 : ~CGNT_reg;
assign BGNT_n   = OE_n ? 1'b0 : ~BGNT_reg;
assign LDR_n    = OE_n ? 1'b0 : ~LDR_reg;
assign CSEM_n   = OE_n ? 1'b0 : ~CSEM_reg;
assign BSEM_n   = OE_n ? 1'b0 : ~BSEM_reg;
assign LOEN25_n = OE_n ? 1'b0 : ~LOEN25_reg;
assign BCGNT25  = OE_n ? 1'b0 : ~BCGNT25_n_reg;



endmodule

/*

DESCRIPTION

PRIORITY:   1.REFRESH
            2.CPU * LAST DONE REFRESH
            3.BUS
            4.CPU

; 270387 CJUTC: INCREASE PERIOD BETWEEN SUCCESSIVE GRANTS BY 25NS BY
; INTRODUCING NEW SIGNAL MFREE25~ AND NOT GRANTING ANYTHING UNTIL
; THIS IS TRUE
; 020487 JLB: MFREE NOT NEEDED, BUT TO AVIOD POWER UP PROBLEMS MCL ADDED.
;
; 180587 M3202B

*/

