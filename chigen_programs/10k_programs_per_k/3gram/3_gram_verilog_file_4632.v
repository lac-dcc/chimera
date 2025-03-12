// Seed: 2894008496
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_5 = -1'b0;
  wire  id_6;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  input wire _id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_9,
      id_1,
      id_8,
      id_1
  );
  inout wire id_1;
  logic [7:0] id_10, id_11;
  logic id_12;
  logic [7:0] id_13;
  always_latch deassign id_5;
  assign id_5 = id_13[id_7];
  assign id_11[-1] = -1;
endmodule
