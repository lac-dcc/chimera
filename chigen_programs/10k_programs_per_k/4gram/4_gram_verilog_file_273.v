// Seed: 4207051407
module module_0 (
    input wand id_0,
    output wire id_1,
    output tri0 id_2,
    output wand id_3,
    output tri id_4,
    input tri0 id_5,
    input wor id_6,
    output supply0 id_7,
    output wire id_8
    , id_15,
    input wor id_9,
    input supply0 id_10,
    output supply0 id_11,
    input supply0 id_12,
    input uwire id_13
);
  generate
    logic id_16;
  endgenerate
endmodule
module module_1 #(
    parameter id_15 = 32'd59,
    parameter id_8  = 32'd17
) (
    output wire id_0,
    output supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input wand id_4,
    output tri1 id_5,
    output uwire id_6,
    input supply0 id_7,
    input wire _id_8,
    output tri1 id_9,
    output supply0 id_10,
    output wire id_11
    , id_18,
    output wor id_12,
    input wire id_13,
    input supply1 id_14,
    input tri _id_15,
    output wire id_16
);
  assign id_18[id_8*-1-!id_15] = !id_2;
  module_0 modCall_1 (
      id_14,
      id_10,
      id_10,
      id_10,
      id_1,
      id_2,
      id_7,
      id_12,
      id_0,
      id_14,
      id_2,
      id_5,
      id_13,
      id_13
  );
  assign modCall_1.id_13 = 0;
endmodule
