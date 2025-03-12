// Seed: 2037981323
module module_0 (
    input tri id_0,
    input tri id_1,
    output wor id_2,
    output wand id_3,
    output supply0 id_4,
    output wire id_5,
    output supply0 id_6,
    input wor id_7,
    input supply0 id_8,
    output wand id_9
);
endmodule
module module_1 #(
    parameter id_14 = 32'd55,
    parameter id_4  = 32'd72,
    parameter id_6  = 32'd74
) (
    output supply0 id_0,
    output wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    input uwire _id_4,
    output wand id_5,
    input tri _id_6,
    input wor id_7,
    input supply1 id_8
    , id_17,
    output supply1 id_9,
    input wand id_10,
    input supply0 id_11,
    input supply0 id_12,
    input wor id_13,
    input uwire _id_14,
    input uwire id_15
);
  wire id_18;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_9,
      id_5,
      id_9,
      id_0,
      id_0,
      id_2,
      id_2,
      id_9
  );
  assign modCall_1.id_5 = 0;
  struct packed {
    logic id_19;
    logic [1 'b0 : 1] id_20;
    logic [id_4 : id_14] id_21;
    logic id_22;
  } [-1 : id_6]
      id_23, id_24;
endmodule
