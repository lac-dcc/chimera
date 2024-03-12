/*
 * implementation of Spartan-6 LUT4 for simulation
 */
module LUT4( 
    output O, 
    input I0, 
    input I1, 
    input I2, 
    input I3 );

  parameter INIT = 16'h00000000;

  reg lut [15:0];

  integer i;

  initial 
    for(i = 0; i < 16; i++ )
       lut[i] = INIT[i];

  assign O = lut[{I3,I2,I1,I0}];

endmodule



