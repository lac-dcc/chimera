// Seed: 4158254805
module module_0 (
    output wor   id_0,
    input  tri   id_1,
    output wor   id_2,
    output tri1  id_3,
    output tri1  id_4,
    input  uwire id_5,
    input  uwire id_6,
    input  wire  id_7,
    output tri   id_8,
    output wand  id_9
);
  assign module_2.id_2 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    input  wand id_1,
    output tri  id_2
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2
  );
endmodule
module module_2 (
    input supply0 id_0,
    output wand id_1,
    output tri id_2,
    input tri1 id_3,
    output tri1 id_4
    , id_10,
    output wire id_5,
    output wor id_6,
    input tri0 id_7,
    output wor id_8
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_8,
      id_6,
      id_7,
      id_7,
      id_7,
      id_2,
      id_5
  );
  assign id_8 = -1;
endmodule
