// Seed: 2559749912
module module_0 (
    output supply0 id_0,
    output wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wor id_5,
    input supply1 id_6,
    input tri id_7,
    output wor id_8
);
  wire id_10;
  assign id_1 = id_3;
  assign module_1.id_6 = 0;
  integer id_11 (
      .id_0(id_10),
      .id_1(1),
      .id_2(1)
  );
  wire id_12;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  wand  id_2,
    input  wor   id_3,
    input  wor   id_4,
    output uwire id_5,
    output uwire id_6,
    output uwire id_7,
    input  uwire id_8
);
  logic [7:0] id_10 = (id_10[1]);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_8,
      id_4,
      id_2,
      id_1,
      id_1,
      id_7
  );
endmodule
