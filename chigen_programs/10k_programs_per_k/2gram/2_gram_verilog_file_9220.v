// Seed: 1616377606
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input wor id_2,
    input supply0 id_3,
    output uwire id_4#(
        .id_12(1),
        .id_13(1 ^ 1),
        .id_14(1 | -1),
        .id_15(1),
        .id_16(1)
    ),
    input supply1 id_5,
    output wand id_6,
    output wand id_7,
    output supply0 id_8,
    input wor id_9,
    input wire id_10
);
  wire  id_17;
  logic id_18;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd14
) (
    input tri1 id_0,
    input uwire id_1,
    input wire id_2,
    output wand _id_3,
    output supply1 id_4,
    output wand id_5
);
  logic [1 : id_3] id_7 = id_0 <-> 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_1,
      id_5,
      id_2,
      id_5,
      id_5,
      id_4,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
