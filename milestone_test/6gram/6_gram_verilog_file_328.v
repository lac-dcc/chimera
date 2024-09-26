// Seed: 3691517035
`define pp_2 0
`timescale 1ps / 1ps
`define pp_3 0
`timescale 1ps / 1ps
module module_0 (
    output reg id_0,
    input  reg id_1
);
  initial begin
    id_0 <= id_1 - 1;
    id_0 = id_1;
    id_0 <= 1'b0;
  end
endmodule
