// Seed: 1418776329
module module_0 (
    output supply0 id_0,
    output wire id_1,
    output tri1 id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input tri0 id_8,
    input wand id_9,
    input uwire id_10,
    input wor id_11,
    input tri0 id_12
    , id_14
);
  wire [-1 'd0 : 1] id_15;
endmodule
module module_1 (
    output wor id_0,
    output tri id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wor id_5,
    output wor id_6,
    output uwire id_7,
    input wor id_8
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_8,
      id_5,
      id_3,
      id_6,
      id_8,
      id_3,
      id_2,
      id_8,
      id_5,
      id_5
  );
  assign modCall_1.id_12 = 0;
  wire id_10;
  ;
  assign id_7 = id_10;
endmodule
