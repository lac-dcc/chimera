// Seed: 3302935727
module module_0 (
    input tri id_0,
    input uwire id_1,
    input tri0 id_2,
    input wire id_3,
    input uwire id_4,
    input supply1 module_0,
    input tri id_6,
    output wire id_7,
    output tri0 id_8
);
  wire id_10;
  assign id_8 = ((1'b0)) != id_10;
  assign id_7 = id_3;
endmodule
module module_1 #(
    parameter id_12 = 32'd60
) (
    input supply0 id_0,
    input uwire id_1,
    input uwire id_2,
    input wand id_3,
    input supply1 id_4,
    output tri0 id_5,
    input wire id_6,
    output wire id_7,
    input tri id_8,
    input uwire id_9,
    input wire id_10,
    output wor id_11,
    input uwire _id_12,
    output wor id_13,
    output wor id_14,
    input uwire id_15,
    input tri0 id_16,
    input tri id_17
);
  logic [-1 : id_12] id_19 = 1, id_20;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6,
      id_9,
      id_1,
      id_3,
      id_4,
      id_11,
      id_5
  );
  assign modCall_1.id_7 = 0;
  localparam id_21 = 1;
endmodule
