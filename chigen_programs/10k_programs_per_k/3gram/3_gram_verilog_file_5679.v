// Seed: 2996986179
module module_0 (
    input  tri0  id_0,
    output wire  id_1,
    input  uwire id_2,
    input  tri   id_3,
    output tri0  id_4,
    output tri0  id_5,
    output wand  id_6,
    input  tri0  id_7,
    output tri1  id_8,
    input  tri   id_9,
    input  wand  id_10,
    input  tri0  id_11,
    input  wire  id_12,
    input  wand  id_13,
    output wire  id_14,
    input  uwire id_15,
    input  tri0  id_16
);
  wire id_18;
  assign id_14 = 1;
  tri1 id_19 = id_2;
  id_20(
      .id_0(id_2 == id_3), .id_1(), .id_2(1)
  );
  wire id_21;
  assign id_4 = id_0;
  id_22(
      .id_0(id_13), .id_1(id_18), .id_2(1), .id_3(1), .id_4(1'b0)
  );
endmodule
module module_1 (
    output wor  id_0,
    input  tri1 id_1
);
  wire id_3;
  bufif0 primCall (id_0, id_1, id_3);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_30 = 0;
endmodule
