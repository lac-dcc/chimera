// Seed: 3110232019
module module_0 (
    output tri0 id_0
    , id_15,
    output wand id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri id_4,
    input wor id_5,
    output supply1 id_6,
    output tri id_7,
    input wand id_8,
    output wire id_9,
    input wor id_10,
    input tri0 id_11,
    output supply1 id_12,
    input tri1 id_13
);
endmodule
module module_1 (
    output tri1 id_0,
    output supply0 id_1,
    output uwire id_2,
    input supply0 id_3,
    input tri id_4,
    input tri1 id_5
);
  assign id_2 = id_4 && -1'b0;
  or primCall (id_1, id_5, id_4);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_1,
      id_0,
      id_3,
      id_1,
      id_5,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
