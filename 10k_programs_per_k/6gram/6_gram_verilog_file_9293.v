// Seed: 1894059692
`default_nettype id_1
`define pp_3 0
`timescale 1ps / 1ps
module module_0 (
    output id_0,
    input reg id_1,
    output reg id_2
);
  always @(posedge id_1 or negedge id_1 != 1) begin
    id_0 <= id_1;
    id_0 = 1'd0;
    id_2 <= id_1(id_1);
  end
endmodule
