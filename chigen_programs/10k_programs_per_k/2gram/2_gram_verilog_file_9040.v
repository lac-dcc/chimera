// Seed: 2139613138
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    output wire id_3,
    output wire id_4,
    input wor id_5,
    input wire id_6#(1 !== id_18 | id_6),
    input wor id_7,
    input supply1 id_8,
    input wand id_9,
    input wor id_10,
    output wor id_11,
    output uwire id_12,
    output supply1 id_13,
    input tri1 id_14,
    output wor id_15,
    output tri0 id_16,
    input wire id_17,
    input tri0 id_18
);
  id_20 :
  assert property (@(1) id_18)
  else;
  wire id_21;
  wire id_22;
  assign id_20 = id_3++;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1
    , id_17,
    input wor id_2,
    output tri1 id_3,
    input tri id_4,
    input wand id_5,
    input supply1 id_6,
    input supply0 id_7,
    output supply1 id_8,
    input wand id_9,
    input supply1 id_10,
    inout supply0 id_11,
    output wor id_12,
    input logic id_13,
    input wire id_14,
    output wand id_15
);
  wire id_18;
  always id_17 <= (id_13);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_8,
      id_3,
      id_8,
      id_5,
      id_4,
      id_10,
      id_11,
      id_10,
      id_5,
      id_15,
      id_15,
      id_12,
      id_10,
      id_11,
      id_3,
      id_10,
      id_11
  );
  assign modCall_1.type_1 = 0;
  assign id_11 = 1;
  assign id_3 = 1;
endmodule
