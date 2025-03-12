// Seed: 282724222
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output tri1 id_2,
    input wand id_3,
    output uwire id_4,
    input supply0 id_5,
    input tri1 id_6,
    output wor id_7,
    input uwire id_8,
    output tri0 id_9,
    output supply0 id_10,
    output tri1 id_11,
    input supply1 id_12,
    output uwire id_13,
    output uwire id_14
);
  uwire [1 : -1] id_16 = 1 ? 1 - 1'd0 : !id_5;
  wire id_17 = 1;
  assign id_11 = 1;
  assign id_16 = id_8;
endmodule
module module_1 (
    input  tri  id_0,
    output wand id_1,
    inout  tri0 id_2,
    input  wire id_3
);
  assign id_2 = id_0 != (id_2 & -1 & 1 & id_2 == {id_3{id_2}});
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_3,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
