// Seed: 3586415615
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
    id_12
);
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_13, id_14, id_15, id_16, id_17;
  wire id_18, id_19;
  assign id_14[-1] = -1;
  wire id_20;
  parameter id_21 = 1 + id_11;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_1(-1'b0);
  always_latch id_3 <= -1;
  assign id_2 = ~id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_2,
      id_5,
      id_2,
      id_5,
      id_5,
      id_2
  );
endmodule
