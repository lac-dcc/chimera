// Seed: 2644926900
module module_0 (
    input  tri0  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output wire  id_3,
    output uwire id_4,
    output tri0  id_5
);
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    input supply1 id_2,
    output uwire id_3,
    input wand id_4,
    input tri1 id_5,
    input tri1 id_6,
    output wand id_7
);
  wire id_9 = id_6;
  assign id_3 = &id_0 ? id_6 : -1'b0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
