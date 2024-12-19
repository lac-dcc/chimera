// Seed: 1063335818
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input wand id_2,
    output tri1 id_3,
    input wor id_4,
    output tri id_5
);
  wire id_7, id_8;
  tri  id_9;
  wire id_10;
  assign id_9 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  logic id_1,
    output uwire id_2
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.type_12 = 0;
  logic [7:0] id_4;
  assign id_4[1] = (id_1) == 1;
  always force id_4 = id_1;
  wire id_5;
  wire id_6;
endmodule
