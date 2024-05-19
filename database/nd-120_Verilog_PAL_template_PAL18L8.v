// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL 16L8
// 10 INPUT only pins (I0-I9)
// 2 OUT only pins (Y0-Y1) and 6 IN or OUT pins (B0-B5)
//
// PAL16RL8 (https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf)


/* 
PALASM PINS

I0 I1 I2 I3 I4 I5 I6 I7 I8 GND
I9 O8/Y1 IO7/B5 IO6/B4 IO5/B3 IO4/B2 IO3/B1 IO2/B0 IO1/B6 O1/Y0 VCC

*/


module PAL_16L8(

    input I0,           // I0
    input I1,           // I1
    input I2,           // I2
    input I3,           // I3
    input I4,           // I4
    input I5,           // I5
    input I6,           // I6   
    input I7,           // I7    


    output Y0_n,        // Y0_n (Can be IN or OUT)
    output Y1_n,        // Y1_n (Can be IN or OUT)
    
    output B0_n,        // B0_n
    output B1_n,        // B1_n
    output B2_n,        // B2_n
    output B3_n,        // B3_n
    output B4_n,        // B4_n             
    output B5_n         // B5_n             
);


// * TEMPLATE *

assign B0_n = I0;

endmodule