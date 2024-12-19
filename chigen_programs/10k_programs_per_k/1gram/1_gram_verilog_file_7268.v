// Seed: 3960267992
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
    id_17
);
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_18, id_19;
  logic [7:0][1] id_20;
endmodule
module module_1 (
    output wire id_0,
    output wire id_1,
    input supply1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    input tri id_6,
    output wand id_7,
    output tri id_8,
    output tri id_9,
    output supply0 id_10,
    input uwire id_11,
    output uwire void id_12
);
  wire id_14;
  genvar id_15, id_16;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_15,
      id_14,
      id_14,
      id_16,
      id_15,
      id_16,
      id_15,
      id_16,
      id_16,
      id_15,
      id_14,
      id_14,
      id_16,
      id_15,
      id_16
  );
  assign id_10 = id_11 != 1 <-> 1;
endmodule
