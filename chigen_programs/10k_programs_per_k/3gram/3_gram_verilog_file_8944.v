// Seed: 2370053943
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output tri0 id_4,
    output tri id_5,
    input supply0 id_6
);
  final begin : LABEL_0
    id_5 = (1 - "");
  end
  wire id_8;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    output wand  id_4,
    input  uwire id_5
);
  assign id_4 = 1;
  xnor primCall (id_4, id_3, id_5, id_1, id_2, id_0);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3
  );
endmodule
