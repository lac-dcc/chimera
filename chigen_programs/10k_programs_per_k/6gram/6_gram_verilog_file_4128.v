// Seed: 2803890593
module module_0 (
    input  tri0  id_0,
    output uwire id_1,
    output tri0  id_2,
    input  wor   id_3,
    input  tri0  id_4,
    output uwire id_5
);
  assign id_5 = "" ? 1'h0 : id_3 ? 1 : 1;
  assign {1'b0, id_0} = id_4;
  wire id_7;
  assign module_2.type_4 = 0;
endmodule
module module_1 (
    input  tri  id_0,
    input  wand id_1,
    output wire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  tri1  id_0,
    input  uwire id_1,
    output wor   id_2
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2
  );
endmodule
