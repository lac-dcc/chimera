// Seed: 1195739716
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = 1;
  uwire id_15, id_16;
  assign id_9 = id_1 ? 1'b0 : id_15;
  wire id_17, id_18;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  nand primCall (id_2, id_1, id_3, id_6);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_4,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2
  );
endmodule
