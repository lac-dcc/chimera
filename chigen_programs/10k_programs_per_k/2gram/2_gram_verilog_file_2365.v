// Seed: 1779056693
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply1 id_4,
    input uwire id_5
);
  assign id_0 = (1);
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri1  id_1,
    output wire  id_2,
    input  wire  id_3,
    output tri   id_4,
    output tri0  id_5,
    input  tri   id_6,
    input  uwire id_7,
    input  wand  id_8,
    output tri   id_9
);
  assign id_9 = id_6;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_8,
      id_7,
      id_6,
      id_6
  );
  assign modCall_1.id_5 = 0;
  wire id_11;
  assign id_1 = 1;
endmodule
