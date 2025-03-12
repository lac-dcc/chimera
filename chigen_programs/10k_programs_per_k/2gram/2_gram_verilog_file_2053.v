// Seed: 1276119705
module module_0 (
    output wand  id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  uwire id_3
);
  logic id_5;
  ;
  assign id_0 = id_3;
  module_2 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
  always id_5 = id_1;
endmodule
macromodule module_1 (
    output tri0 id_0,
    output tri  id_1,
    input  wand id_2,
    input  wire id_3
);
  parameter id_5 = 1;
  not primCall (id_0, id_2);
  assign id_0 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  wand  id_0,
    output wand  id_1,
    input  uwire id_2,
    input  wire  id_3,
    input  uwire id_4
);
  assign id_1 = 1;
endmodule
