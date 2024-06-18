// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R4
// JLB 25FEB87
// 44407A,19F ,ERFFIX

// PCB 3202D sheet 34:
//
// PAL input signal PD1 is connected to PAL OE_n (and PD1 to PD4 is ALWAYS 0/FALSE in the 3202 circuit board)
//     input signal CLK is connectec to PAL CK pin

module PAL_44407A(
    input CK,       // Clock signal
    input OE_n,     // OUTPUT ENABLE (active-low) for Q0-Q3

    input IDBS0,       // I0 - CSIDBS0
    input IDBS1,       // I1 - CSIDBS1
    input IDBS2,       // I2 - CSIDBS2 
    input IDBS3,       // I3 - CSIDBS3
    input IDBS4,       // I4 - CSIDBS4 
    input WRTRF,       // I5 - WRTRF
    input LCS_n,       // I6 - LCS_n
                       // I7 - (not connected)
                    
    output ERF_n,      // B0_n - ERF_n
                       // B1_n - (not connected)

    output RRF_n       // Q0_n - RRF_n
                       // Q2_n - (not connected)
                       // Q3_n - (not connected)
                       // Q4_n - (not connected)

);

// Inverted input signals
wire IDBS4_n = ~IDBS4;
wire IDBS3_n = ~IDBS3;
wire IDBS1_n = ~IDBS1;  

reg RRF_reg; // Register for RRF_n output

// Sequential logic triggered on the rising edge of CLK
always @(posedge CK) begin   

    // IDBS = REG FILE = 5

    // Logic for RRF
    RRF_reg <= LCS_n & IDBS4_n & IDBS3_n & IDBS2 & IDBS1_n & IDBS0;

end

// Tri-state control for outputs
// High-impedance state when OE_n is high (active-low)
assign RRF_n = OE_n ? 1'b0 : ~RRF_reg;


// Logic for ERF_n (active-low)
assign ERF_n = ~(RRF_reg | WRTRF);

endmodule



/*
DESCRIPTION

; 180587 M3202B

*/