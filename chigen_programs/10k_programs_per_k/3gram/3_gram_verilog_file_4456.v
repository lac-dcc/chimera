// Seed: 2000261144
module module_0 (
    input  tri0  id_0,
    output wire  id_1,
    output tri1  id_2,
    output uwire id_3,
    input  tri0  id_4,
    input  tri1  id_5
);
  assign id_3 = 1;
  assign id_3 = id_5;
  assign id_2 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    output tri0 id_2,
    input wor id_3,
    input supply1 id_4,
    output wire id_5
);
  nor primCall (id_2, id_1, id_0, id_4);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_5,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_5 = id_1;
endmodule
