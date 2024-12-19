// Seed: 1794141743
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    output wire id_2,
    output wire id_3,
    input supply1 id_4,
    output supply1 id_5,
    input tri id_6,
    output tri id_7,
    output wand id_8,
    input supply0 id_9,
    input wand id_10,
    output wor id_11
);
  wire id_13, id_14;
  reg id_15, id_16, id_17, id_18;
  wire id_19;
  assign id_3 = 1;
  final @(1 or id_16 or 1) id_16 <= id_16 ^ 1 ==? 1'b0 - 1;
  wire id_20;
  assign #1 id_7 = 1'd0;
  assign id_7 = 1;
  assign id_11 = id_19;
  wire id_21;
  module_0 modCall_1 (
      id_21,
      id_14,
      id_13,
      id_14,
      id_20,
      id_13
  );
endmodule
