// Seed: 881844491
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
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  output wire id_23;
  input wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_24 = {1, id_13, id_8, 1};
  assign module_1.type_30 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wire id_1,
    input uwire id_2,
    input tri1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    output tri0 id_6,
    input tri1 id_7,
    output tri id_8,
    input supply1 id_9,
    output tri id_10,
    input uwire id_11,
    input uwire id_12,
    input wor id_13,
    output uwire id_14,
    input wor id_15
    , id_23,
    output tri id_16,
    output tri0 id_17,
    input supply1 id_18,
    input tri0 id_19
    , id_24,
    input tri0 id_20,
    output wand id_21
);
  always @(id_0 or negedge ~(id_12)) id_24 = 1;
  module_0 modCall_1 (
      id_23,
      id_24,
      id_23,
      id_24,
      id_23,
      id_24,
      id_23,
      id_24,
      id_23,
      id_23,
      id_23,
      id_23,
      id_23,
      id_24,
      id_23,
      id_23,
      id_23,
      id_23,
      id_24,
      id_24,
      id_23,
      id_23,
      id_24
  );
  assign id_10 = id_4;
endmodule
