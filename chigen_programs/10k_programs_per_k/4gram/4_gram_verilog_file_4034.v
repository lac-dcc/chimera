// Seed: 3706114142
module module_0 (
    output uwire id_0
    , id_11,
    output tri1 id_1,
    input wand id_2,
    output tri id_3,
    output supply1 id_4,
    output tri0 id_5,
    output tri1 id_6,
    input wand id_7,
    input uwire id_8,
    output wand id_9
);
  tri1 id_12;
  assign id_3 = 1;
  tri0 id_13 = 1;
  assign id_5 = 1;
  wire id_14;
endmodule
module module_1 (
    output tri0  id_0,
    output wand  id_1,
    input  uwire id_2,
    input  tri0  id_3
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
