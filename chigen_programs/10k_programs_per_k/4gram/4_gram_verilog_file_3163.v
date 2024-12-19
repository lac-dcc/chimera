// Seed: 1589782726
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input tri id_2,
    input wire id_3,
    input supply1 id_4,
    input wand id_5,
    output uwire id_6,
    input tri1 id_7,
    output wand id_8
);
  wire id_10;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    output wand id_2,
    input uwire id_3,
    input uwire id_4,
    input wire id_5,
    output wand id_6,
    output tri id_7,
    input uwire id_8
);
  tri0 id_10 = id_3, id_11;
  assign id_6 = id_11;
  module_0 modCall_1 (
      id_11,
      id_6,
      id_0,
      id_8,
      id_8,
      id_11,
      id_10,
      id_5,
      id_2
  );
  wire id_12;
  wire id_13 = 1;
  assign id_1 = id_4;
  tri1 id_14 = 1 ? id_14 : {1, id_10, 1} & 1;
endmodule
