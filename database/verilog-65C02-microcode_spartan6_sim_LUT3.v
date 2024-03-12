/*
 * implementation of Spartan-6 LUT3 for simulation
 */
module LUT3( 
    output O, 
    input I0, 
    input I1, 
    input I2 );

  parameter INIT = 8'h00;

  reg lut [7:0];

  integer i;

  initial 
    for(i = 0; i < 8; i++ )
       lut[i] = INIT[i];

  assign O = lut[{I2,I1,I0}];

endmodule



