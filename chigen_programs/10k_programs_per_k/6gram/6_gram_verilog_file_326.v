// Seed: 936066107
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output wor id_2,
    output uwire id_3,
    output wor id_4,
    output uwire id_5,
    output wire id_6,
    output tri id_7,
    input supply1 id_8,
    output uwire id_9
);
  assign id_4 = 1'b0 ? 1 : id_0;
endmodule
module module_1 (
    input  wand  id_0,
    output uwire id_1,
    output tri0  id_2
);
  tri0 id_4 = 1 ? id_4 : id_0;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_2,
      id_2,
      id_4,
      id_2,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
