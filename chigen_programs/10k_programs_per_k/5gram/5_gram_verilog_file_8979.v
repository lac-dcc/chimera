// Seed: 4106343104
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wire id_3,
    input uwire id_4,
    input tri1 id_5
);
  wire id_7;
endmodule
module module_1 (
    input wand  id_0,
    input uwire id_1,
    input wire  id_2,
    input wand  id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output wand id_0,
    input tri0 id_1,
    output tri id_2,
    output wire id_3,
    output wor id_4,
    output tri id_5,
    input wor id_6,
    output tri id_7,
    input tri1 id_8
    , id_15,
    output supply1 id_9,
    output tri id_10,
    output supply1 id_11
    , id_16,
    output uwire id_12,
    input tri1 id_13
);
  assign id_4 = -1;
  wor id_17 = -1;
  and primCall (id_5, id_15, id_13, id_17, id_1, id_6, id_16, id_8);
  module_0 modCall_1 (
      id_6,
      id_8,
      id_13,
      id_1,
      id_1,
      id_13
  );
endmodule
