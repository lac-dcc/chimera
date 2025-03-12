// Seed: 2326923538
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input wire module_0,
    output uwire id_3,
    output wand id_4,
    output wor id_5,
    input wand id_6,
    input supply1 id_7,
    input uwire id_8,
    output supply1 id_9,
    input wire id_10,
    input supply0 id_11,
    input supply0 id_12
);
  wire id_14;
  ;
  parameter id_15 = 1;
  assign id_3 = 1 & id_12 == -1 ? (1) : 1;
  logic id_16, id_17, id_18;
  assign id_17 = id_11;
  logic id_19, id_20;
  logic id_21;
  ;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output supply1 id_2,
    output supply1 id_3,
    input tri0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_3,
      id_2,
      id_3,
      id_4,
      id_4,
      id_1,
      id_3,
      id_4,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
