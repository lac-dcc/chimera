// Seed: 3207906637
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_3;
  wire id_4;
  wire id_5;
  wire id_6, id_7;
  wire id_8;
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
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_12
  );
  inout wire id_12;
  output wire id_11;
  input logic [7:0] id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_11 = id_4;
  logic id_15 = -1, id_16;
  assign id_14 = id_10[1'b0];
  id_17 :
  assert property (@(id_15) -1'b0) $unsigned(35);
  ;
  wire id_18;
  wire id_19;
  or primCall (id_13, id_1, id_10, id_12, id_4, id_14, id_7, id_8);
  parameter id_20 = 1;
  localparam id_21 = id_20;
endmodule
