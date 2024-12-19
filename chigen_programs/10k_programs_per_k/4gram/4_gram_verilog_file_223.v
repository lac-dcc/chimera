// Seed: 1823911401
module module_0 (
    input tri id_0,
    output uwire id_1,
    input wand id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wand id_7,
    output uwire id_8,
    input wand id_9,
    input tri1 id_10,
    input tri0 id_11,
    input supply1 id_12
);
  wire id_14;
  assign module_1.type_19 = 0;
  tri  id_15 = id_3 / id_12 + 1 % id_11;
  wire id_16;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input tri id_2,
    output tri1 id_3,
    inout uwire id_4,
    input wand id_5,
    input tri1 id_6,
    output wand id_7,
    input wire id_8,
    input wor id_9,
    input tri1 id_10,
    output wand id_11,
    input wire id_12
);
  wire id_14;
  xnor primCall (id_4, id_9, id_2, id_14, id_0, id_5, id_6, id_12, id_10, id_8);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_5,
      id_4,
      id_2,
      id_10,
      id_2,
      id_4
  );
  integer id_15 = id_14;
  wire id_16;
endmodule
