// Seed: 817686626
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
    id_15
);
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout supply0 id_10;
  output wire id_9;
  output wand id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_16, id_17;
  logic \id_18 = id_17;
  wire  id_19;
  assign id_10 = 1;
  assign id_8  = 1;
  wire id_20;
  wire id_21;
  wire id_22;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_2,
      id_2,
      id_2,
      id_2,
      id_6,
      id_6,
      id_4,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2,
      id_4
  );
  assign id_5[1] = -1;
  nand primCall (id_4, id_5, id_1, id_6, id_2, id_3);
endmodule
