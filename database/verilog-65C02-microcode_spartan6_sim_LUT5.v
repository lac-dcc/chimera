/*
 * implementation of Spartan-6 LUT5 for simulation
 */
module LUT5( 
    output O, 
    input I0, 
    input I1, 
    input I2, 
    input I3, 
    input I4 );

  parameter INIT = 32'h0000000000000000;

  reg lut [31:0];

  integer i;

  initial 
    for(i = 0; i < 64; i++ )
       lut[i] = INIT[i];

  assign O = lut[{I4,I3,I2,I1,I0}];

endmodule



