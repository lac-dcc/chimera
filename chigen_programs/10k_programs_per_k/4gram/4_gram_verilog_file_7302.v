// Seed: 3410162430
module module_0 (
    output uwire id_0,
    input tri id_1,
    output wor id_2,
    output supply1 id_3,
    output supply1 id_4,
    input wand id_5,
    input supply0 id_6,
    output tri0 id_7,
    output supply1 id_8,
    input wand id_9
);
  wire id_11;
  wire id_12;
  wor  id_13;
  assign id_13 = 1'b0;
  id_14(
      1'b0, 1
  );
endmodule
module module_1 (
    input  tri0  id_0,
    output tri   id_1,
    input  wand  id_2,
    input  wor   id_3,
    input  tri   id_4,
    input  wor   id_5,
    input  uwire id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_4,
      id_5,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.type_3 = 0;
  id_9(
      .id_0(id_6), .id_1(id_2), .id_2(id_1 - 1), .id_3(id_4), .id_4(1)
  );
  wire id_10;
  id_11(
      .id_0(1), .id_1(id_1), .id_2(1), .id_3(1)
  );
  tri0 id_12 = 1;
  tri  id_13 = 1'b0;
endmodule
