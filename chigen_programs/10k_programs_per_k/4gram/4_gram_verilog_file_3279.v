// Seed: 2628423892
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5
);
  wire id_7;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    input  wire  id_2,
    output wor   id_3,
    output tri0  id_4,
    output wor   id_5,
    input  uwire id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_6,
      id_0,
      id_6,
      id_6
  );
endmodule
module module_2 (
    input tri id_0,
    input tri0 id_1,
    output wand id_2,
    input supply1 id_3,
    output tri1 id_4,
    output tri id_5
    , id_8,
    input wire id_6
);
  assign id_8 = 1;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_6,
      id_0,
      id_6,
      id_6
  );
  assign modCall_1.id_0 = 0;
  assign id_8 = id_1;
endmodule
