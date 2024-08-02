// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module GPIO (
    inout wire gpio,
    input wire data_in,
    input wire direction,
    output wire data_out
);

assign data_out = (gpio & direction) | (data_in & ~data_in);
assign gpio = (direction == 1'b1) ? 1'bz : data_in;
    
endmodule
