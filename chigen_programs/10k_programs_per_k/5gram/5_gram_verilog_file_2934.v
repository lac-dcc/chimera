// Seed: 3079206738
module module_0 (
    output tri1  id_0,
    output wor   id_1,
    input  wor   id_2,
    input  wire  id_3,
    output uwire id_4,
    input  wand  id_5,
    input  wire  id_6,
    input  wire  id_7,
    output wand  id_8
);
  wire id_10;
  logic [7:0] id_11;
  assign id_11[1] = id_5 ? 1 : id_2;
endmodule
module module_1 (
    input uwire id_0,
    output supply0 id_1,
    input uwire id_2,
    input supply0 id_3,
    inout wand id_4,
    input tri id_5,
    output wand id_6,
    input tri1 id_7
);
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_5,
      id_6
  );
  assign modCall_1.type_14 = 0;
  assign id_6 = id_5;
endmodule
