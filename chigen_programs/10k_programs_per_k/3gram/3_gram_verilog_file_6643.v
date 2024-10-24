// Seed: 1739471644
`timescale 1ps / 1ps
module module_0 (
    id_1,
    id_2
);
  inout id_2;
  inout id_1;
  always @(posedge 1) begin
    id_1 = id_2;
  end
  assign id_2 = id_1[1'b0 : 1];
endmodule
