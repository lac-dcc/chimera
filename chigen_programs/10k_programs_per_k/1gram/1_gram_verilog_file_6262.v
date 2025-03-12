// Seed: 965325704
module module_0 (
    input uwire id_0,
    input wor id_1[1 : -1],
    input wor id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri id_5,
    output tri id_6,
    output supply1 id_7,
    output uwire id_8,
    input uwire id_9,
    output uwire id_10,
    input tri id_11,
    input wand id_12
);
endmodule
module module_1 #(
    parameter id_10 = 32'd30,
    parameter id_6  = 32'd93
) (
    input uwire id_0,
    input tri1 id_1[-1  &  id_10 : 1 'b0 -  id_6],
    output wor id_2,
    output supply0 id_3,
    input wand id_4,
    input tri0 id_5,
    input wor _id_6,
    input tri0 id_7,
    input wor id_8,
    output uwire id_9,
    input uwire _id_10,
    input wire id_11,
    input uwire id_12,
    output tri0 id_13,
    input tri1 id_14
);
  wire  id_16;
  logic id_17;
  assign id_2 = !"";
  module_0 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_3,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3,
      id_4,
      id_9,
      id_7,
      id_7
  );
  assign modCall_1.id_5 = 0;
endmodule
