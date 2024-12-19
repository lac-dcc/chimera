// Seed: 1979191299
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input uwire id_2
    , id_8,
    output tri0 id_3,
    input wire id_4,
    output wand id_5,
    input wire id_6
);
  assign id_5 = id_0;
  tri0 id_9 = id_1;
endmodule
module module_1 (
    output wand  id_0,
    input  uwire id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1
  );
endmodule
module module_2 (
    input supply0 id_0,
    input supply0 id_1,
    output tri0 id_2
);
  assign id_2 = 1'b0;
  tri0 id_4;
  xnor primCall (id_2, id_1, id_4, id_0);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_1 = 0;
endmodule
