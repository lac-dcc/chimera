// Seed: 2258277974
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    output wor id_2,
    input wor id_3,
    output uwire id_4
    , id_13,
    input tri0 id_5,
    output uwire id_6,
    output wor id_7,
    output supply0 id_8,
    output wand id_9,
    input tri0 id_10,
    output wor id_11
);
  wire id_14;
  wire id_15;
  assign id_13 = id_3 ~^ id_5;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    output wand id_6
);
  parameter id_8 = 1;
  wire id_9;
  logic [1 : 1] id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5,
      id_1,
      id_5,
      id_0,
      id_6,
      id_5,
      id_5,
      id_6,
      id_1,
      id_3
  );
  assign id_10 = id_0;
endmodule
