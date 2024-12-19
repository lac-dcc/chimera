// Seed: 3999304147
module module_0 (
    input tri id_0,
    input tri id_1,
    input uwire id_2,
    input uwire id_3,
    output wire id_4,
    input supply1 id_5,
    input supply1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri1 id_9,
    output tri0 id_10,
    input tri0 id_11,
    output supply1 id_12,
    output supply0 id_13
);
  assign id_10 = 1 ? 1'b0 == id_7 : 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    input  wor   id_2,
    output wor   id_3
);
  tri id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_3,
      id_1,
      id_0,
      id_0,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.type_4 = 0;
  assign id_3 = 1'b0;
  assign id_5 = 1;
endmodule
