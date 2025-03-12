// Seed: 644204631
module module_0 (
    output tri1 id_0,
    output wire id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wire id_5,
    output tri0 id_6,
    output wire id_7,
    output tri id_8
);
endmodule
module module_1 #(
    parameter id_4 = 32'd7
) (
    output tri0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri id_3
    , id_14,
    input wire _id_4,
    input uwire id_5,
    output supply0 id_6,
    output wor id_7,
    output supply0 id_8,
    input wire id_9,
    input wand id_10,
    output tri id_11,
    output supply0 id_12
);
  assign id_0 = id_14;
  wire id_15;
  assign id_14[id_4] = 1'b0;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_5,
      id_9,
      id_5,
      id_8,
      id_6,
      id_8,
      id_11
  );
  assign modCall_1.id_1 = 0;
  tri1 id_16 = 1;
endmodule
