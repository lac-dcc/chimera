// Seed: 351939819
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  always_latch @(posedge 1'b0 | {1, id_1} or posedge 1) begin : LABEL_0
    assume #1  (1) $display(id_1);
    else $display;
  end
  tri  id_3 = id_1 == 1 ^ id_1;
  wire id_4;
  initial id_3 = id_3 * 1 + 1;
  wire id_5;
  generate
    wire id_6;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_8,
      id_11
  );
  id_15(
      .id_0(id_1), .id_1(id_2[1])
  );
endmodule
