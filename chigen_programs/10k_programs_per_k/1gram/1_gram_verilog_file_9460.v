// Seed: 1989174820
module module_0 (
    input tri1 id_0,
    output wire id_1,
    output wire id_2,
    input tri1 id_3,
    input tri id_4,
    input wand id_5,
    input supply0 id_6,
    input wand id_7,
    input supply1 id_8,
    input supply1 id_9,
    input tri id_10,
    input tri id_11,
    output supply0 id_12,
    input uwire id_13
);
  wire id_15;
endmodule
module module_1 (
    output supply0 id_0,
    input logic id_1,
    input tri1 id_2,
    output wand id_3
    , id_22,
    output uwire id_4,
    output tri0 id_5,
    output wor id_6,
    output tri0 id_7,
    input wire id_8,
    input wire id_9,
    input wire id_10,
    input wire id_11,
    input tri0 id_12,
    output wor id_13,
    output tri0 id_14,
    input supply1 id_15,
    input wor id_16,
    input supply1 id_17,
    input wire id_18,
    input wor id_19,
    input supply0 id_20
);
  logic id_23;
  assign id_23 = id_1;
  wire id_24;
  wire id_25, id_26;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_8,
      id_18,
      id_20,
      id_8,
      id_17,
      id_9,
      id_18,
      id_18,
      id_0,
      id_16
  );
  assign modCall_1.type_1 = 0;
  always id_23 <= id_1;
  always_ff $display(1 ^ id_1, 1 && 1, 1, id_22, 1'h0, 1);
endmodule
