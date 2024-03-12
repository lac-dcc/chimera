/*
 * implementation of Spartan-6 CARRY4 ripple carry block
 */
module CARRY4( 
    input CI,
    input CYINIT,
    input [3:0] DI,
    input [3:0] S,
    output [3:0] CO,
    output [3:0] O );

    wire CO0 = S[0] ? CI | CYINIT : DI[0];
    wire CO1 = S[1] ? CO0 : DI[1];
    wire CO2 = S[2] ? CO1 : DI[2];
    wire CO3 = S[3] ? CO2 : DI[3];

    assign O  = S ^ {CO2, CO1, CO0, CI | CYINIT};
    assign CO = { CO3, CO2, CO1, CO0 };

endmodule
