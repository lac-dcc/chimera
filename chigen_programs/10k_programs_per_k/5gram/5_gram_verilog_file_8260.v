// Seed: 1703375953
module module_0 (
    input wire id_0,
    output tri1 id_1,
    input wand id_2,
    input supply0 id_3
);
  assign id_1 = 1'b0;
  wire id_5;
  wire id_6;
  module_2 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_3
  );
  wire id_7;
  nand primCall (id_1, id_3, id_6, id_5, id_0, id_2);
endmodule
module module_1 (
    input  uwire id_0,
    output tri   id_1,
    input  tri   id_2
);
  wire id_4 = 1'b0;
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.type_10 = 0;
endmodule
module module_2 (
    output wand id_0,
    input  wire id_1,
    output wand id_2,
    input  wire id_3
);
  wire id_5;
  wire id_6;
  assign module_0.id_2 = 0;
  wire id_7, id_8;
endmodule
