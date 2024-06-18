// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL 16L8
// 8 INPUT only pins (I0-I9)
// 4 OUT only pins (Y0-Y1) and 4 IN or OUT pins (B0-B5)



// PAL16R4 (https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf)
// I/O 1,2, 7 and 8 (Pins B0 to B3) is not controlled by OE_n, only O3,O4,O5 and O6 (Pin's Q0-Q3)


/* 
PALASM PINS

CLK I0 I1 I2 I3 I4 I5 I6 I7 GND
/OE IO8/B3 IO7/B2 O6/Q3 O5/Q2 O4/Q1 O3/Q0 IO2/B1 IO1/B0 VCC

*/


module PAL_16R4(
    input CLK,          // Clock signal
    input OE_n,         // OUTPUT ENABLE (active-low) for Q0-Q3

    input I0,           // I0
    input I1,           // I1
    input I2,           // I2
    input I3,           // I3
    input I4,           // I4
    input I5,           // I5
    input I6,           // I6   
    input I7,           // I7    


    output Q0_n,        // Q0_n (Three-state and clocked)
    output Q1_n,        // Q1_n (Three-state and clocked)
    output Q2_n,        // Q2_n (Three-state and clocked)
    output Q3_n,        // Q3_n (Three-state and clocked)
    
    output B0_n,        // B0_n Can be IN or OUT)
    output B1_n,        // B1_n Can be IN or OUT)
    output B2_n,        // B2_n Can be IN or OUT)
    output B3_n         // B3_n Can be IN or OUT)
);

endmodule