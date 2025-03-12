// Seed: 3684251400
module module_0 (
    output tri1  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output tri0  id_4,
    input  tri0  id_5
);
  wire id_7, id_8;
  wire id_9;
  wire [-1 : 1] id_10;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input wand id_2,
    input supply1 id_3,
    output supply1 id_4,
    output uwire id_5,
    output tri0 id_6,
    output tri0 id_7,
    input wor id_8,
    input tri0 id_9,
    input uwire id_10,
    input wand id_11
);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_8,
      id_8,
      id_6,
      id_11
  );
  assign modCall_1.id_4 = 0;
endmodule
