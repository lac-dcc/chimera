// Seed: 2262909199
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input uwire id_2,
    input uwire id_3,
    output uwire id_4,
    output wire id_5,
    input wand id_6,
    output supply1 id_7,
    input tri0 id_8
);
  wire id_10;
endmodule
module module_1 (
    input  tri   id_0,
    input  tri1  id_1,
    output uwire id_2,
    output uwire id_3
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_3,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_2 (
    output supply0 id_0,
    output wire id_1,
    output wand id_2,
    output wor id_3,
    input supply0 id_4,
    output uwire id_5,
    input tri0 id_6,
    inout wire id_7,
    input tri id_8
    , id_13, id_14,
    output supply0 id_9,
    input tri1 id_10,
    output wire id_11
);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_7,
      id_5,
      id_9,
      id_6,
      id_5,
      id_4
  );
endmodule
