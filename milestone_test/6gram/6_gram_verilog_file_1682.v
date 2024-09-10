// Seed: 3392850272
module module_0 #(
    parameter id_10 = 32'd29
) (
    input id_1,
    output logic id_3,
    input id_4,
    output id_5,
    input id_6,
    output logic id_7,
    input id_8,
    output id_9
);
  logic _id_10;
  logic id_11;
  always @(negedge id_8) begin
    SystemTFIdentifier(1, id_4, 1, 1, (1), id_7, 1, 1, 1, id_2, 1, 1, ~id_1 & 1'd0, id_9, 1, id_11,
                       1'd0, id_1, .id_12(id_4), id_9);
    if (id_3[id_10]) id_10 <= #1 id_10;
    else id_5 <= 1;
  end
  assign id_8 = 1;
  logic id_13;
endmodule
`timescale 1ps / 1ps `default_nettype id_1
module module_1 (
    input id_1,
    output reg id_2,
    input id_3,
    input reg id_4,
    inout logic id_5,
    output id_6,
    input id_7,
    output logic id_8,
    input id_9,
    input reg id_10,
    input id_11,
    input id_12,
    output logic id_13
);
  type_20(
      id_4[1], id_2, 1
  );
  initial begin
    id_12 <= 1;
    id_2  <= 1;
    id_10 <= id_12;
  end
endmodule
