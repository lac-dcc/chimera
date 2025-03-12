// Seed: 889048566
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input wor id_2,
    input tri0 id_3,
    output wor id_4,
    input wand id_5,
    input supply1 id_6
);
  wire id_8;
  wire id_9, id_10, id_11;
  parameter id_12 = 1;
  wire id_13;
endmodule
module module_1 (
    output wire id_0,
    input  wire id_1,
    input  tri1 id_2,
    input  tri  id_3,
    input  tri0 id_4
);
  assign id_0 = id_0++ ? 1 : 1 ? -1 : id_2;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_3,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
  assign id_0 = id_4;
endmodule
