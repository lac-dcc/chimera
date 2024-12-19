// Seed: 1120609697
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
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_20;
  wire id_21;
endmodule
module module_1 (
    output tri1 id_0,
    output supply0 id_1,
    output wor id_2,
    output supply1 id_3#(.id_16(id_6 ? 1 : 1'h0)),
    input tri1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input wire id_7,
    input tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    output wor id_11
    , id_17,
    output supply0 id_12,
    output wire id_13,
    input supply1 id_14
);
  wire id_18;
  wand id_19 = 1 & 1;
  nand primCall (
      id_11, id_10, id_4, id_6, id_5, id_18, id_19, id_17, id_8, id_14, id_7, id_16, id_9
  );
  module_0 modCall_1 (
      id_19,
      id_19,
      id_17,
      id_18,
      id_18,
      id_17,
      id_18,
      id_17,
      id_19,
      id_19,
      id_19,
      id_18,
      id_19,
      id_17,
      id_19,
      id_17,
      id_17,
      id_17,
      id_18
  );
endmodule
