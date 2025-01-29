// Seed: 1755675169
module module_0 (
    output wand id_0,
    output uwire id_1,
    input supply0 id_2,
    id_9,
    input supply0 id_3,
    input supply0 id_4,
    output supply1 id_5,
    output supply0 id_6,
    output tri id_7
);
  assign id_0 = id_3;
  assign id_7 = id_4;
  assign id_7 = id_2;
  wire id_10, id_11, id_12;
  wire id_13, id_14;
  wire id_15;
endmodule
macromodule module_1 (
    input  tri   id_0,
    output uwire id_1,
    output tri0  id_2,
    output uwire id_3,
    output tri1  id_4,
    input  tri   id_5
);
  assign id_1 = ('b0);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_5,
      id_0,
      id_3,
      id_4,
      id_4
  );
  uwire id_7;
  id_8(
      -1
  );
  assign {-1} = id_5;
  always
    if (-1) id_7 = -1;
    else id_4 = id_8;
  logic [7:0][1] id_9, id_10 = (id_9);
endmodule
