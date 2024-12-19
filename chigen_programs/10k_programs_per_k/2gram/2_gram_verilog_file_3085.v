// Seed: 111786014
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input uwire id_2,
    input supply0 id_3,
    input wire id_4,
    output wand id_5,
    output supply1 id_6,
    input wire id_7
);
  assign id_5 = 1'h0;
  assign module_2.type_6 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  wand  id_3,
    output wor   id_4,
    input  wire  id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output wire id_0,
    output wand id_1
    , id_8,
    input supply1 id_2,
    output tri id_3,
    input wire id_4,
    input wand id_5,
    input supply0 id_6
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_6,
      id_1,
      id_1,
      id_6
  );
endmodule
