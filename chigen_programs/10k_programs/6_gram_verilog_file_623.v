// Seed: 3556154777
`timescale 1ps / 1ps
module module_0 (
    input id_0,
    output logic id_1,
    input reg id_2,
    output logic id_3,
    output reg id_4
);
  assign id_4 = 1 ? 1 : id_2;
  always @(posedge id_0)
    if (~id_2) begin
      id_4 <= 1'd0;
    end else id_4 <= id_0;
endmodule
