// Seed: 80077836
module module_0 (
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16#(
        .id_17(~1),
        .id_18({-1, id_19, 1'b0})
    ),
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25
);
  output wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_26 = 1'b0;
  assign id_7 = id_24;
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
    id_10
);
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output reg id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  assign id_6 = id_10;
  logic [1 : -1] id_11;
  wire id_12;
  logic id_13;
  ;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_13,
      id_7,
      id_12,
      id_13,
      id_7,
      id_13,
      id_11,
      id_5,
      id_12,
      id_1,
      id_13,
      id_8,
      id_5,
      id_13,
      id_7,
      id_8,
      id_12,
      id_12,
      id_9,
      id_12
  );
  always #1 begin : LABEL_0
    id_6 <= id_11;
  end
endmodule
