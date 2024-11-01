// Seed: 517228172
module module_0 (
    input uwire id_0,
    input wor id_1,
    output wor id_2,
    input uwire id_3,
    input uwire id_4,
    output supply0 id_5,
    output tri id_6,
    output tri id_7,
    input uwire id_8
);
  assign id_7 = 1;
  wire id_10;
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  wire  id_2,
    output wor   id_3,
    input  tri0  id_4
);
  assign id_3 = id_2;
  module_0(
      id_0, id_2, id_3, id_4, id_0, id_3, id_3, id_3, id_1
  );
endmodule
module module_2 (
    input  wand  id_0,
    input  wand  id_1,
    output uwire id_2
);
  wire id_4;
  module_0(
      id_1, id_0, id_2, id_1, id_1, id_2, id_2, id_2, id_1
  );
  assign id_2 = id_1;
  xnor (id_2, id_4, id_1, id_0);
endmodule
