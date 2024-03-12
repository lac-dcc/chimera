/*
 * Implementation of Spartan-6 LUT6 for simulation
 */
module LUT6( 
    output O, 
    input I0, 
    input I1, 
    input I2, 
    input I3, 
    input I4, 
    input I5 );

  parameter INIT = 64'h0;

  reg lut [63:0];

  integer i;

  initial 
    for(i = 0; i < 64; i++ )
       lut[i] = INIT[i];

  assign O = lut[{I5,I4,I3,I2,I1,I0}];

endmodule

