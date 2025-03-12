// Seed: 3767145154
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    output wor id_3
    , id_6,
    input supply0 id_4
);
  wire id_7;
  module_2 modCall_1 (
      id_4,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  wand  id_3
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_2
  );
endmodule
module module_2 (
    input  wand id_0,
    output tri0 id_1
);
endmodule
module module_3 (
    output wand id_0,
    output supply0 id_1,
    input wor id_2
);
  wire id_4;
  module_2 modCall_1 (
      id_2,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_0 = id_4 + -1'b0;
endmodule
