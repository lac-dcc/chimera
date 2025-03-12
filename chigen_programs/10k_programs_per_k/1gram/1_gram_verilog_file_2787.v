// Seed: 1310228548
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
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_15, id_16;
  wire id_17;
  parameter id_18 = 1;
endmodule
module module_1 (
    output tri1 id_0[1 : -1],
    input  wor  id_1,
    input  tri  id_2,
    input  tri  id_3,
    input  wand id_4
);
  wire id_6;
  wire id_7;
  xor primCall (id_0, id_7, id_2, id_4, id_1, id_3, id_6);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
