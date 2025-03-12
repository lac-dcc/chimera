// Seed: 1400178335
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge {1, id_2#(.id_3(1))} | ~id_6 or posedge 1'd0);
  wire id_9;
  wire id_10 = id_3;
  logic id_11 = id_11, id_12, id_13, id_14, id_15, id_16, id_17;
  assign id_10 = 1;
  logic id_18 = id_4;
  logic id_19 = id_11;
  wire  id_20;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire [-1 : 1] id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule
