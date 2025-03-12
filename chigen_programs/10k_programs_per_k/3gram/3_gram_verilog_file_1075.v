// Seed: 2164957856
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    input supply0 id_3,
    input uwire id_4,
    input supply1 id_5,
    output supply0 id_6,
    output supply1 id_7,
    output tri0 id_8,
    input wor id_9,
    input wire id_10,
    input tri1 id_11,
    input wand id_12,
    output uwire id_13,
    input tri0 id_14,
    output wor id_15,
    output tri1 id_16,
    input wand id_17
    , id_23,
    input supply0 id_18,
    output wand id_19
    , id_24,
    output wire id_20
    , id_25,
    output wire id_21
);
  wire  id_26;
  logic id_27;
endmodule
module module_1 #(
    parameter id_0 = 32'd70,
    parameter id_5 = 32'd96
) (
    input uwire _id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wand id_3,
    input supply0 id_4,
    input tri0 _id_5,
    output wire id_6,
    input wor id_7,
    output supply1 id_8,
    output wire id_9,
    input wor id_10,
    input supply0 id_11
);
  wire [id_0 : -1  +  id_5] id_13;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_10,
      id_7,
      id_7,
      id_10,
      id_8,
      id_8,
      id_9,
      id_11,
      id_11,
      id_4,
      id_3,
      id_9,
      id_3,
      id_9,
      id_9,
      id_7,
      id_3,
      id_6,
      id_8,
      id_9
  );
  assign modCall_1.id_11 = 0;
endmodule
