// Seed: 1611014954
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    input tri id_5,
    output tri id_6,
    input uwire id_7,
    output wand id_8,
    output supply1 id_9,
    input wire id_10,
    input wand id_11
);
  assign id_9 = id_5;
  assign id_8 = (id_2 == 1);
  wire id_13, id_14;
  assign module_1.type_9 = 0;
  tri0 id_15 = 1'h0;
endmodule
module module_1 (
    output wor   id_0,
    output tri1  id_1,
    input  uwire id_2,
    input  tri0  id_3
);
  supply1 id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_3,
      id_0,
      id_5,
      id_1,
      id_5,
      id_2,
      id_5
  );
  wire id_6;
  if (id_5) assign id_0 = id_5;
  assign id_1 = id_5;
endmodule
