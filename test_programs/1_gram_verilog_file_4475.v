// Seed: 2854552155
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri id_2,
    output wor id_3,
    output supply1 id_4,
    input wand id_5,
    input tri id_6,
    input tri0 id_7,
    input wand id_8
);
  wire id_10;
  wor  id_11;
  wire id_12;
  assign id_11 = 1'b0;
  tri0 id_13, id_14 = id_0;
  initial id_3 = id_10;
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    input  wor   id_2,
    output wor   id_3,
    output tri0  id_4,
    output wor   id_5,
    input  uwire id_6,
    output uwire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_3,
      id_5,
      id_6,
      id_6,
      id_6,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
