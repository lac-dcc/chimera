// Seed: 2477252501
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output uwire id_2,
    input supply1 id_3,
    input tri1 id_4,
    input supply0 id_5
);
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    input  wor   id_2,
    output wor   id_3
);
  assign id_3 = id_0;
  tri1 id_5;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.type_9 = 0;
  wire id_6;
  assign id_5 = 1;
  wire id_7;
  id_8(
      .id_0(id_5),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(),
      .id_5(1),
      .id_6(id_6),
      .id_7(),
      .id_8(id_7),
      .id_9(1)
  );
  assign id_3 = 1'd0;
endmodule
