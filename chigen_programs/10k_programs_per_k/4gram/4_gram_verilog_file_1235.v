// Seed: 2105302575
module module_0 (
    output wor id_0,
    output tri id_1,
    inout wor id_2,
    output wand id_3,
    output tri0 module_0,
    input tri0 id_5,
    input wand id_6,
    input supply1 id_7,
    input supply1 id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri id_11,
    input wire id_12,
    input wand id_13,
    input wire id_14,
    output wor id_15,
    output wor id_16,
    output supply1 id_17
    , id_20,
    output wand id_18
);
  assign id_3 = id_6 ? id_7 + id_20 : (-1);
  logic id_21 = id_12;
endmodule
module module_1 #(
    parameter id_21 = 32'd26,
    parameter id_4  = 32'd91
) (
    input tri1 id_0,
    output wand id_1,
    input uwire id_2,
    input tri0 id_3,
    input supply0 _id_4,
    output wor id_5,
    input wire id_6,
    inout wire id_7,
    input wire id_8,
    input wire id_9,
    input tri0 id_10,
    input wor id_11,
    input tri0 id_12,
    input supply1 id_13,
    output tri0 id_14,
    output supply1 id_15,
    output wire id_16,
    output wor id_17,
    output supply0 id_18,
    input supply0 id_19,
    output supply1 id_20,
    output supply1 _id_21,
    input wire id_22,
    input uwire id_23,
    input uwire id_24
);
  logic [id_4 : id_21] id_26, id_27;
  assign id_15 = id_6 * id_4 + id_6;
  module_0 modCall_1 (
      id_20,
      id_1,
      id_7,
      id_15,
      id_16,
      id_12,
      id_2,
      id_0,
      id_3,
      id_15,
      id_6,
      id_5,
      id_3,
      id_7,
      id_23,
      id_15,
      id_17,
      id_5,
      id_17
  );
  assign modCall_1.id_4 = 0;
endmodule
