// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R4
// CJTC 30SEP87
// 44511A, 26H, LEV0

// PAL16R4 (https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf)

// Four D flip-flops controlled by CLK signal (and reads input to flip-flop O3,O4,O5 and O6) when transision from LOW to HIGH.
// O3-O6 output is controlled by OE_n (HIGH signal means output is three-state)

// PCB 3202D sheet 34:
//
// PAL input signal PD1 is connected to PAL OE_n (and PD1 to PD4 is ALWAYS 0/FALSE in the 3202 circuit board)
//     input signal CLK is connectec to PAL CK pin





module PAL_44511A(
    input CK,       // Clock signal
    input OE_n,     // OUTPUT ENABLE (active-low) for Q0-Q3

    input PIL0,     // I0 - PIL0
    input PIL1,     // I1 - PIL1
    input PIL2,     // I2 - PIL2 
    input PIL3,     // I3 - PIL3 
    input CLK,      // I4 - CLK (same signal as CK) 
    input MREQ_n,   // I5 - MREQ_n
    input WCA_n,    // I6 - WCA_n  
    //input I7,       // I7 - (not connected)

    output CUP,      // Q0_n - (not connected)
    //output Q1_n,   // Q1_n - (not connected)
    //output Q2_n,   // Q2_n - (not connected)
    //output Q2_n,   // Q3_n - (not connected)

   
    output CWR_n,    // B0_n - CWR_n
    //output B1_n,   // B1_n - (not connected)
    //output B2_n,   // B2_n - (not connected)
    output LEV0      // B3_n - LEV0

);


// Register declarations for state-holding variables
reg CWR_reg;
reg CUP_n_reg;


// negated wires
wire MREQ = ~MREQ_n;
wire WCA = ~WCA_n;
wire CLK_n = ~CLK;

// LEVEL ZERO
assign LEV0 = ~(PIL3 | PIL2 | PIL1 | PIL0);


always @(posedge CK) begin

    // Logic for CWR (Cache Write Register)
    if ((MREQ & WCA) ==1)  // SET ON WRITE TO CACHE
        CWR_reg <= 1'b1;
    else if ((CLK_n) == 0)  // HOLD UNTIL START OF NEXT CYCLE
        CWR_reg <= 1'b0;

    // Logic for CUP  (ADDED CACHE UPDATE BIT)
    if ((CWR_n & MREQ_n)==1)   // SET IN WRITE TO CACHE
        CUP_n_reg <= 1'b0;
    else if (MREQ_n ==0)    // HOLD UNTIL NEXT MREQ
        CUP_n_reg <= 1'b1;
end

// outputs
assign CWR_n = OE_n ? 1'b0 : ~CWR_reg;
assign CUP   = OE_n ? 1'b0 : ~CUP_n_reg;


endmodule


/*
DESCRIPTION

; 180587 M3202B

061087 CJTC : ADDED CACHE UPDATE BIT (CUP) FOR M3202D

*/