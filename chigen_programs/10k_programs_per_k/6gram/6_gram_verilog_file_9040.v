// Seed: 366526550
module module_0 (
    input supply0 id_0,
    output tri1 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input tri id_4,
    input supply0 id_5,
    input tri id_6,
    output wire id_7
);
endmodule
module module_1 (
    input  tri  id_0,
    output wand id_1,
    input  wire id_2,
    output tri  id_3,
    input  wor  id_4,
    output wor  id_5
);
  tri1 id_7;
  tri0 id_8;
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_7 = 1'b0 ? id_2 * 1 : 1 & id_4 == 1'b0;
  assign id_1 = 1;
  assign id_8 = 1;
endmodule
