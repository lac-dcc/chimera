// Seed: 1208411333
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    input tri0 id_6,
    output wand id_7,
    input tri0 id_8,
    output tri id_9,
    output tri0 id_10,
    input tri id_11,
    output wire id_12,
    input tri0 id_13
);
  wire id_15, id_16;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output tri id_2,
    output tri0 id_3,
    input wor id_4,
    input supply0 id_5
);
  assign id_2 = 1 & id_0;
  assign id_3 = id_0 | 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_3,
      id_4,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_10 = 0;
  tri0 id_7;
  wor  id_8;
  assign id_7 = id_1 ? id_5 : 1;
  assign id_2 = 1'b0 ? (id_8) : id_4;
  tri1 id_9 = 1;
endmodule
