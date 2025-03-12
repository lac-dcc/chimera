// Seed: 1604018411
module module_0 (
    output tri id_0,
    input uwire id_1,
    input wand id_2,
    output tri1 id_3,
    input wand id_4,
    input supply1 id_5,
    input tri0 id_6,
    output tri1 id_7,
    input uwire id_8,
    output wand id_9
);
  assign id_9 = id_1;
  wire id_11;
endmodule
module module_1 #(
    parameter id_3 = 32'd42
) (
    output wire id_0,
    input supply1 id_1,
    output tri1 id_2,
    input tri1 _id_3,
    input wor id_4,
    output wor id_5,
    input uwire id_6,
    output wire id_7,
    input tri1 id_8
);
  wire [id_3 : 1] id_10;
  assign id_2 = id_8;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_0,
      id_4,
      id_8,
      id_6,
      id_0,
      id_6,
      id_0
  );
  assign modCall_1.id_9 = 0;
endmodule
