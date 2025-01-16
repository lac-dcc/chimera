// Seed: 112965275
module automatic module_0 (
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
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_17;
  wire id_18;
  wire id_19;
  assign module_1.type_23 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input wand id_2,
    id_18,
    input supply0 id_3,
    input wor id_4,
    input wor id_5,
    output tri0 id_6,
    input tri0 id_7,
    input wand id_8,
    input tri1 id_9,
    output tri1 id_10,
    input wor id_11,
    output wand id_12,
    input supply0 id_13,
    input wor id_14,
    output wor id_15,
    input wire id_16
);
  assign id_10 = -1;
  parameter id_19 = 1'b0 - 1;
  xnor primCall (id_10, id_5, id_16);
  wire id_20, id_21;
  module_0 modCall_1 (
      id_21,
      id_19,
      id_19,
      id_18,
      id_20,
      id_19,
      id_21,
      id_19,
      id_19,
      id_20,
      id_19,
      id_21,
      id_19,
      id_20,
      id_20,
      id_20
  );
endmodule
