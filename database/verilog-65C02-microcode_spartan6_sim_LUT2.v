/*
 * implementation of Spartan-6 LUT2 for simulation
 */
module LUT2( 
    output O, 
    input I0, 
    input I1 );

  parameter INIT = 4'h0;

  reg lut [3:0];

  integer i;

  initial 
    for(i = 0; i < 4; i++ )
       lut[i] = INIT[i];

  assign O = lut[{I1,I0}];

endmodule



