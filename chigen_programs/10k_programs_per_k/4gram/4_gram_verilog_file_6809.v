// Seed: 2495537753
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
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_15;
  assign id_11 = id_8;
  wand id_16 = 1;
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
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = 1 & id_1[1];
  xnor primCall (id_2, id_7, id_1, id_8, id_6, id_4, id_9);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_6,
      id_4,
      id_6,
      id_4,
      id_7,
      id_7,
      id_4,
      id_7,
      id_7,
      id_6,
      id_6,
      id_7
  );
endmodule
