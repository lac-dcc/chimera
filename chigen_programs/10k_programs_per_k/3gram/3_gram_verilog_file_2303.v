// Seed: 3400545969
module module_0 (
    output wor id_0
    , id_13,
    input supply1 id_1,
    output supply0 id_2,
    input tri id_3,
    output tri id_4,
    input tri0 id_5,
    output tri0 id_6,
    input supply0 id_7,
    output wire id_8,
    input wire id_9,
    input uwire id_10,
    output supply0 id_11
);
  wire id_14;
  wire id_15;
  wand id_16 = 1;
  assign id_16 = id_5;
  wire id_17;
endmodule
module module_1 (
    output wand id_0,
    input  tri0 id_1,
    input  tri  id_2,
    input  tri0 id_3,
    output tri1 id_4
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_3,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_4
  );
  assign modCall_1.type_2 = 0;
  int id_6 (.id_0(id_0));
  bufif0 primCall (id_4, id_2, id_3);
endmodule
