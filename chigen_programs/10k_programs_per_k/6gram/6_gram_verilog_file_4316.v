// Seed: 3178124061
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input supply1 id_4,
    output tri0 id_5
    , id_7
);
  wire id_8;
endmodule
module module_1 (
    output wand id_0
    , id_5,
    input supply0 id_1,
    input wire id_2,
    output supply0 id_3
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_5,
      id_5,
      id_3
  );
  assign modCall_1.type_0 = 0;
  assign id_5 = id_2;
endmodule
module module_2 (
    output tri0 id_0,
    input  tri0 id_1
);
  wand id_3;
  id_4(
      .id_0("" == (id_3 ==? 1)), .id_1(id_3), .id_2(id_0), .id_3(id_1)
  );
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
