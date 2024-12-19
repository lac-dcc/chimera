// Seed: 4240789655
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    output wand id_3
    , id_7,
    input supply1 id_4
    , id_8,
    input tri0 id_5
);
  wire  id_9;
  wire  id_10;
  uwire id_11 = 1'b0;
  wand  id_12 = 1;
  tri   id_13;
  wire  id_14;
  assign id_13 = id_5;
  wire id_15;
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    input wand id_2,
    input tri0 id_3,
    input uwire id_4,
    output tri1 id_5,
    output tri id_6,
    input uwire id_7
    , id_12,
    output wand id_8,
    input supply1 id_9,
    input supply0 id_10
);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_1,
      id_7
  );
  assign modCall_1.type_0 = 0;
endmodule
