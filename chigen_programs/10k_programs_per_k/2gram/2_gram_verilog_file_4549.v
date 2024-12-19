// Seed: 637023286
module module_0 (
    input tri0 id_0,
    input tri0 id_1
);
  tri0 id_3 = 1 - (id_0);
endmodule
macromodule module_1 (
    input  uwire id_0,
    input  wand  id_1,
    input  tri1  id_2,
    output tri1  id_3,
    input  wire  id_4
);
  module_0 modCall_1 (
      id_0,
      id_2
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    input wire id_0,
    input wire id_1,
    input supply1 id_2,
    output supply1 id_3
);
  assign id_3 = id_0 ? 1 : id_2 ? 1 : 1;
  module_0 modCall_1 (
      id_2,
      id_2
  );
  assign modCall_1.type_1 = 0;
endmodule
