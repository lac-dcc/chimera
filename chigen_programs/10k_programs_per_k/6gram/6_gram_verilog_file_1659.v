// Seed: 2935720323
module module_0 (
    input supply0 id_0,
    output wire id_1,
    input wand id_2,
    input uwire id_3,
    output wire id_4,
    input wor id_5,
    input uwire id_6,
    output supply1 id_7,
    input supply0 id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri id_11,
    output supply1 id_12,
    output tri0 id_13,
    input tri1 id_14,
    input wand id_15,
    output uwire id_16,
    input wand id_17,
    input wand id_18,
    output wor id_19
);
  assign id_9 = -1;
endmodule
module module_1 #(
    parameter id_13 = 32'd25
) (
    output supply0 id_0
    , id_16,
    inout wire id_1,
    output wand id_2,
    output wire id_3,
    input tri0 id_4,
    input tri0 id_5,
    output wand id_6
    , id_17,
    input uwire id_7,
    input wire id_8,
    output wor id_9,
    output supply1 id_10,
    output wor id_11,
    output tri1 id_12,
    input tri1 _id_13,
    output tri0 id_14
);
  wire id_18, id_19;
  nand primCall (id_12, id_19, id_17, id_18, id_7, id_5, id_1, id_8, id_16);
  always #1 begin : LABEL_0
    fork
      id_20(id_20[id_13]);
    join
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_5,
      id_4,
      id_10,
      id_1,
      id_10,
      id_5,
      id_11,
      id_6,
      id_12,
      id_4,
      id_8,
      id_3,
      id_1,
      id_8,
      id_12
  );
  assign modCall_1.id_0 = 0;
endmodule
