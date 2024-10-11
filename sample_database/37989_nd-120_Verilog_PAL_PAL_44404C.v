// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R4
// JLB 26NOV86
// 44404C,14D,CYIN1

// PAL16R4D (https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf)

// I/O 1,2, 7 and 8 (Pins B0 to B3) is not controlled by OE_n, only O3,O4,O5 and O6 (Pin's Q0-Q3)
// NOTE: B0 to B3 is input OR output depending on PALASM code.

// Four D flip-flops controlled by CLK signal (and reads input to flip-flop O3,O4,O5 and O6) when transision from LOW to HIGH.
// O3-O6 output is controlled by OE_n (HIGH signal means output is three-state)

module PAL_44404C(
    input CLK,          // Clock signal
    input OE_n,         // OUTPUT ENABLE (active-low) for Q0-Q3

    input CSDELAY1,     // I0
    input CSALUM1,      // I1
    input CSALUM0,      // I2
    input CSALUI8,      // I3
    input CSALUI7,      // I4
    input LBA3,         // I5
    input LBA1,         // I6
    input LBA0,         // I7

    output NOWRIT_n,    // Q0_n
    output DLSHADOW,    // Q1_n (new output for 44404D)


    input RRF_n,        // B0_n
    input LSHADOW,      // B1_n (new input for 44404D)
    input SLCOND_n,     // B2_n
    output DLY1_n      // B3_n     

    // pin Q2 and Q3 is not used in 44404C
);


// CLK and /OE impacts signals:
//  Q0 = /NOWRIT, Q1=DLSHADOW, Q2= n.c., Q3= n.c.

reg NOWRIT;
reg DLSHADOW_reg;

// PCB 3202D sheet 36:
//
// PAL input signal PD1 is connected to PAL OE_n (and PD1 to PD4 is ALWAYS 0/FALSE in the 3202 circuit board)
//     input signal CLK is connectec to PAL CK pin


// Creating non-negated wires for active-low inputs
wire SLCOND = ~SLCOND_n;
wire RRF = ~RRF_n;


// Creating negated wires for active-high inputs
wire CSALUM1_n = ~CSALUM1;
wire CSALUM0_n = ~CSALUM0;
wire CSALUI8_n = ~CSALUI8;
wire CSALUI7_n = ~CSALUI7;
wire LBA3_n = ~LBA3;

// Flip-flop logic for Q0, Q1, Q2 and Q3 (Asyncronous D flip-flop)
always @(posedge CLK) begin

    // Logic for NOWRIT
    NOWRIT  <=  (CSALUM1_n & CSALUI8_n & CSALUI7_n) | // 
                (CSALUM0_n & CSALUI8_n & CSALUI7_n); // 

    // Logic for DLSHADOW(missing PALASM for 44404D where this is described ?)
    // Ronny: Guessing that the implementation is makeing DLSHADOW being a "delayed" signal based on the CLK signal
    DLSHADOW_reg <= LSHADOW;
end

// Output logic for Q0_n, Q1_n, Q2_n
//Q0
assign NOWRIT_n = OE_n ? 1'b0 : ~NOWRIT;

// Q1
assign DLSHADOW = OE_n ? 1'b0 : DLSHADOW_reg;



// Logic for DLY1_n (active-low)
assign DLY1_n = ~(
                    (CSDELAY1 & LBA3_n & LBA1 & LBA0) |     // 25NS DELAY OF PREVIOUS CYCLE
                    (RRF & SLCOND)                          // ON MICROCODE REQUEST IN ADDITION TO DLY0
);


endmodule