// Seed: 1062001782
module module_0 (
    output tri id_0,
    input wand id_1,
    output wire id_2,
    input uwire id_3
    , id_15,
    output wor id_4,
    input wor id_5,
    input uwire id_6,
    input uwire id_7,
    output wor id_8,
    input supply0 id_9,
    input supply1 id_10,
    output wand id_11,
    input supply1 id_12,
    input supply0 id_13
);
  wire id_16;
  ;
  `define pp_17 0
  assign id_15 = -1;
  wire [1 : 1] id_18;
endmodule
module module_1 #(
    parameter id_14 = 32'd83
) (
    output wor id_0,
    input tri1 id_1,
    output tri1 id_2,
    input tri1 id_3,
    output tri id_4,
    input uwire id_5
    , id_20,
    input wire id_6,
    input supply1 id_7,
    input supply1 id_8,
    input supply1 id_9,
    input wire id_10,
    input wire id_11,
    input tri id_12,
    input wire id_13,
    input uwire _id_14,
    input supply0 id_15,
    output tri id_16,
    output tri id_17,
    input tri0 id_18
);
  wire [id_14 : -1] id_21;
  module_0 modCall_1 (
      id_16,
      id_1,
      id_16,
      id_13,
      id_4,
      id_6,
      id_6,
      id_9,
      id_16,
      id_9,
      id_6,
      id_0,
      id_10,
      id_12
  );
  assign modCall_1.id_10 = 0;
  assign id_2 = id_1 & 1;
  wire id_22;
endmodule
