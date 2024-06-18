// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R6
// JLB 26NOV86
// 44601B, 12D, CYCFSM

//  CYCLE CONTROL STATE COUNTER. FAST VERSION (ND-120/CX).

// PAL16R8 FAMILY
// PAL16R6 has 6 flip-flips, 8 inputs, and 2 input OR output (B0 and B1)

// https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf



// PCB 3202D sheet 36:
//
// PAL input signal PD4 is connected to PAL OE_n pin
//     input signal OSC is connectec to PAL CK pin



module PAL_44601B(
    input CK,           // Clock signal
    input OE_n,         // OUTPUT ENABLE (active-low) for Q0-Q5

    input DLY1_n,       // I0 - DLY1_n
    input DLY0_n,       // I1 - DLY0_n
    input CSDELAY0,     // I2 - CSDELAY0 
    input WAIT1,        // I3 - WAIT1 
    input WAIT2,        // I4 - WAIT2 
    input CGNTCACT_n,   // I5 - CGNTCACT_n
    input HIT,          // I6 - HIT
    input BRK_n,        // I7 - BRK_n                       

    input SLOW_n,       // B0_n - SLOW_n 
    input SHORT_n,      // B1_n - SHORT_n 

    output CX_n,        // Q0_n - CX_n
    output TERM_n,      // Q1_n - TERM_n
    output CC0_n,       // Q2_n - BANK0
    output CC1_n,       // Q3_n - MWRITE_n
    output CC2_n,       // Q4_n - MWRITE_n
    output CC3_n        // Q5_n - MWRITE_n

);

// Internal registers
reg TERM_reg;
reg CC0_reg;
reg CC1_reg;
reg CC2_reg;
reg CC3_reg;


// negated input signals
wire CSDELAY0_n = ~CSDELAY0;
wire WAIT1_n = ~WAIT1;
wire CGNTCACT = ~CGNTCACT_n;
wire BRK = ~BRK_n;
wire WAIT2_n = ~WAIT2;	

wire SHORT = ~SHORT_n;
wire SLOW = ~SLOW_n;

// Reg signals as wires
wire CC3 = CC3_reg;
wire CC2 = CC2_reg;
wire CC1 = CC1_reg;
wire CC0 = CC0_reg;



//**** Sequential logic triggered on the rising edge of CLK ****
always @(posedge CK) begin       

    TERM_reg <=   (CC3_n & CC2_n & CC1_n & CC0_n & SHORT & TERM_n & DLY0_n & CSDELAY0_n)    // 50NS CYCLE
                | (CC3_n & CC2_n & CC1_n & CC0 & SHORT & BRK_n & DLY1_n & TERM_n)           // 75NS CYCLE
                | (CC3_n & CC2_n & CC1_n & CC0 & HIT & BRK_n & DLY1_n & TERM_n)             // 75NS CYCLE
                | (CC3_n & CC2_n & CC1 & CC0 & SHORT & BRK_n & TERM_n)                      // 100NS CYCLE
                | (CC3_n & CC2_n & CC1 & CC0 & HIT & BRK_n & TERM_n)                        // 100NS CYCLE
                | (CC3_n & CC2 & CC1 & CC0 & BRK & TERM_n)                                  // BRK CYCLE  (>200
                | (CC3_n & CC2 & CC1_n & CC0 & SLOW & TERM_n)                               // SLOW CYCLES INCL. FE
                | (CC3 & CC2_n & CC1_n & CC0_n & TERM_n);                                   //; UART, LCS, RWCS CYCLES

    CC3_reg <=   (CC2 & CC1_n & CC0_n & TERM_n)                                             // h+i+j+k+l+m+n+o
               | (CC3 & CC1 &  TERM_n & CC2)
               | (CC3 & CC1 &  TERM_n & CC2_n)
               | (CC3 & CC0 &  TERM_n & CC2 & CC1)
               | (CC3 & CC0 &  TERM_n & CC2_n & CC1)
               | (CC3 & CC0 &  TERM_n & CC2 & CC1_n)
               | (CC3 & CC0 &  TERM_n & CC2_n & CC1_n);

    CC2_reg <=   (CC3_n & CC2 & CC1 & TERM_n)                                               // e+f+g+h+i+j+k
               | (CC2 & CC1_n & TERM_n & CC3)
               | (CC2 & CC1_n & TERM_n & CC3_n)
               | (CC2 & CC0 & TERM_n & CC3)
               | (CC2 & CC0 & TERM_n & CC3_n)
               | (CC3_n & CC2_n & CC1 & CC0_n & CGNTCACT & TERM_n)                          // d WAIT FOR BUS IF
               | (CC3_n & CC2_n & CC1 & CC0_n & WAIT1_n & TERM_n)                           // d WAIT1 and NOT
               | (CC3_n & CC2_n & CC1 & CC0_n & BRK & TERM_n);                              // d BRK

    CC1_reg <=   (CC3_n & CC2_n & CC0 & TERM_n & CC1)                                       // b+c+d+e+j+k+l+m
               | (CC3_n & CC2_n & CC0 & TERM_n & CC1_n)
               | (CC3 & CC2 & CC0 & TERM_n & CC1)
               | (CC3 & CC2 & CC0 & TERM_n & CC1_n)
               | (CC1 & CC0_n & TERM_n & CC2 & CC3)
               | (CC1 & CC0_n & TERM_n & CC2 & CC3_n)
               | (CC1 & CC0_n & TERM_n & CC2_n & CC3)
               | (CC1 & CC0_n & TERM_n & CC2_n & CC3_n);

    CC0_reg <=   (CC3_n & CC2_n & CC1_n & TERM_n)                                           // a+b+f+i+j+m+N
               | (CC3_n & CC2 & CC1 & CC0 & TERM_n)
               | (CC3 & CC2 & CC1_n & TERM_n)
               | (CC3 & CC2_n & CC1 & TERM_n)
               | (CC3_n & CC2 & CC1 & CC0_n & CGNTCACT_n & TERM_n)                          // e WAIT FOR BUS OF LOC
               | (CC3_n & CC2 & CC1 & CC0_n & BRK & TERM_n)                                 // e MEM CYCLE TO FINISH
               | (CC3_n & CC2 & CC1 & CC0_n & WAIT2_n & TERM_n)                               // e IF WAIT2 and NOT BRK
               | (CC3_n & CC2_n & CC1 & CC0 & CGNTCACT & BRK_n * TERM_n);                   // e PREV WRITE



    
end

    /* DEBUG */
    /* verilator lint_off UNUSEDSIGNAL */
wire[3:0] ccReg = {CC3, CC2, CC1, CC0};

// Tri-state control for Q outputs
// Assigning outputs with three-state logic controlled by OE_n
assign CX_n = OE_n ? 1'b0 : 1'b0; // CX is always 1 in the fast version (CX_n = 0)
assign TERM_n = OE_n ? 1'b0 : ~TERM_reg;
assign CC0_n = OE_n ? 1'b0 : ~CC0_reg;
assign CC1_n = OE_n ? 1'b0 : ~CC1_reg;
assign CC2_n = OE_n ? 1'b0 : ~CC2_reg;
assign CC3_n = OE_n ? 1'b0 : ~CC3_reg;



//**** Syncronous logic (always running) ****
// (none)

endmodule

/*

DESCRIPTION

; 060387 JLB: MOD’S FROM SLOW VERSION IMPLEMENTED.
; 060387 JLB: 100 NS CYCLE MIN. NO BUFFERED WRITE.
; 070387 JLB: 75 NS CYCLE MIN. NO BUFFERED WRITE.
; 120387 JLB: IMPROVED HIT PATH. FORM REMOVED. HIT INPUT ON PIN 12.
; SHORT IN ON PIN 4.
; 120387 JLB: 50 NS CYCLE ON SHORT
: 180387 JLB: MR GATED WITH WAIT1 OUTSIDE. NEW INPUT CSDELAY0.
: 180387 JLB: BUFFERED WRITE.
; 180387 JLB: 175NS SLOW & BRK CYCLES.
; 210387 JLB: 200NS SLOW CYCLES.

; 270487 M3202B
; 060887 JLB: MAXIMIZED EQUATIONS TO MATCH CLOCK SKEW.

*/