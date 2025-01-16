// Seed: 1227948882
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
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_9 = 1;
  assign module_1.type_30 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    output tri0 id_2,
    output supply0 id_3,
    input wand id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wire id_7,
    input tri0 id_8,
    output wand id_9,
    input wire id_10,
    input tri id_11,
    input supply0 id_12,
    output wor id_13,
    output wand id_14,
    input supply1 id_15,
    inout tri0 id_16,
    output uwire id_17,
    input supply1 id_18,
    input supply1 id_19,
    output wor id_20,
    input tri id_21,
    id_23
);
  wire  id_24;
  uwire id_25 = 1, id_26;
  wire  id_27;
  wand  id_28, id_29 = id_7;
  nand primCall (
      id_14,
      id_6,
      id_11,
      id_26,
      id_16,
      id_7,
      id_25,
      id_8,
      id_29,
      id_12,
      id_19,
      id_10,
      id_4,
      id_24,
      id_28,
      id_27,
      id_21,
      id_15,
      id_18,
      id_23
  );
  module_0 modCall_1 (
      id_26,
      id_26,
      id_27,
      id_25,
      id_27,
      id_24,
      id_24,
      id_25,
      id_23,
      id_26,
      id_23,
      id_26,
      id_27,
      id_24,
      id_26
  );
endmodule
