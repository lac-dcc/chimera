// Seed: 583598803
`timescale 1 ps / 1ps
module module_0 #(
    parameter id_5 = 32'd29
) (
    input id_1,
    input logic id_2,
    input id_3,
    input logic id_4,
    input _id_5,
    output id_6
);
  assign id_1[1 : 1] = ~|id_5[1];
  assign id_3[id_5] = id_4[1 : 1] !== 1'd0 && 1;
  assign id_4[1] = id_3[1];
  logic id_7;
  always @(posedge SystemTFIdentifier) begin
    id_3 = 1;
  end
endmodule
`timescale 1ps / 1ps
module module_1;
  assign id_1[1] = id_1[1'h0];
  initial begin
    id_1[1'h0] = id_1 * SystemTFIdentifier;
  end
endmodule
