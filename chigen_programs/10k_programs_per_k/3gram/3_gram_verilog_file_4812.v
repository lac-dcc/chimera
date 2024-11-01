// Seed: 905373809
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output supply1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    output supply0 id_7,
    input tri0 id_8,
    input supply0 id_9,
    output wire id_10,
    input tri1 id_11,
    input wand id_12,
    output uwire id_13,
    output wor id_14,
    input tri0 id_15
);
  wire id_17;
  wire id_18;
  assign id_10 = id_1;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    output wand  id_2,
    input  tri   id_3,
    output wand  id_4,
    output wor   id_5,
    output wire  id_6
);
  wire id_8;
  module_0(
      id_1, id_3, id_5, id_1, id_3, id_4, id_1, id_6, id_3, id_3, id_0, id_1, id_3, id_6, id_2, id_3
  );
endmodule
