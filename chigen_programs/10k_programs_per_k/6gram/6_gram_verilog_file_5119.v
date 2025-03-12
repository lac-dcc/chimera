// Seed: 1571881869
module module_0 (
    input  tri   id_0,
    output uwire id_1,
    input  uwire id_2,
    input  wire  id_3,
    input  wand  id_4,
    input  wand  id_5,
    output uwire id_6
);
  always disable id_8;
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    output wand  id_2
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    input  wand id_0,
    input  tri1 id_1,
    input  wor  id_2,
    output wire id_3
);
  assign id_3 = 1;
  wire id_5;
  wire id_6;
  ;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_1,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
