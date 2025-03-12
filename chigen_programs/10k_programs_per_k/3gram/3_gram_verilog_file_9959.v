// Seed: 3014469481
module module_0 (
    output supply1 id_0,
    input tri id_1,
    output supply1 id_2
    , id_7,
    output tri0 id_3,
    input wand id_4,
    output tri1 id_5
);
  assign id_7 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd18
) (
    input tri0 id_0,
    output wand id_1,
    input tri1 _id_2,
    input tri1 id_3,
    output wand id_4,
    output tri0 id_5,
    input wand id_6,
    input wire id_7,
    input uwire id_8,
    output supply1 id_9,
    output wand id_10,
    input wor id_11,
    input supply0 id_12,
    output uwire id_13,
    inout tri0 id_14,
    output wand id_15,
    input supply0 id_16,
    input wire id_17,
    input uwire id_18
);
  wire [1 : id_2] id_20;
  nand primCall (id_10, id_7, id_12, id_11, id_14, id_16, id_0, id_17, id_18);
  module_0 modCall_1 (
      id_4,
      id_18,
      id_1,
      id_5,
      id_0,
      id_10
  );
  assign modCall_1.id_2 = 0;
endmodule
