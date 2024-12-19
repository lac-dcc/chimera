// Seed: 2265940053
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
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22;
endmodule
module module_1 (
    output logic id_0,
    input logic id_1,
    input wire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output wor id_6,
    output supply0 id_7,
    input tri1 id_8,
    input wand id_9,
    output supply1 id_10,
    output tri1 id_11,
    input wor id_12,
    input supply1 id_13,
    input supply0 id_14,
    input tri0 id_15
);
  assign id_0  = 1;
  assign id_11 = 1;
  always id_0 = #1 1;
  wire id_17;
  wire id_18;
  nand primCall (
      id_6,
      id_13,
      id_9,
      id_17,
      id_4,
      id_3,
      id_15,
      id_19,
      id_8,
      id_18,
      id_5,
      id_12,
      id_14,
      id_2,
      id_1
  );
  wire id_19;
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
      id_17
  );
  assign id_0 = id_1;
endmodule
