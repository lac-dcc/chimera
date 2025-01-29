// Seed: 2603228916
module module_0 (
    input  tri1  id_0,
    input  uwire id_1,
    input  tri   id_2,
    output tri   id_3,
    input  wor   id_4
);
  id_6(
      .id_0(-1'h0), .id_1()
  );
  module_2 modCall_1 (
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    output wor  id_1,
    input  tri  id_2,
    input  tri0 id_3,
    input  tri  id_4
);
  assign id_1 = 1 ? id_4 : 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_1,
      id_3
  );
  assign modCall_1.id_4 = 0;
  assign id_1 = id_4;
  wire id_6;
endmodule
module module_2 (
    input supply0 id_0,
    input supply1 id_1,
    input supply1 id_2
);
endmodule
