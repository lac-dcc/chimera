// Seed: 665633697
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wand id_4,
    input tri id_5,
    input tri id_6
    , id_13,
    input supply1 id_7,
    input wand id_8,
    output uwire id_9,
    input uwire id_10,
    output wand id_11
);
  parameter id_14 = 1;
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    output tri   id_2
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output wor  id_0,
    input  tri1 id_1
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
endmodule
