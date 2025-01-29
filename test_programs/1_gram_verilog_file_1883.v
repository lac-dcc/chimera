// Seed: 870606804
module module_0 (
    input  wor  id_0,
    output wor  id_1,
    input  tri0 id_2,
    input  wire id_3,
    output tri  id_4,
    output wand id_5,
    input  tri1 id_6,
    input  tri0 id_7
);
  id_9(
      id_6
  );
  if (id_7) id_10(.id_0(-1), .id_1(id_3), .id_2(1'b0), .id_3(id_1));
  else always id_4 = -1;
endmodule
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    output supply0 id_2,
    input wor id_3,
    output wand id_4,
    input supply1 id_5,
    output uwire id_6,
    output wor id_7,
    input tri id_8,
    input supply1 id_9,
    input tri id_10
);
  supply1 id_12 = id_3;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_6,
      id_12,
      id_5,
      id_9
  );
  assign modCall_1.type_13 = 0;
endmodule
