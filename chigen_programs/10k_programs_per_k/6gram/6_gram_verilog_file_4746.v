// Seed: 1351797645
module module_0 (
    input  uwire id_0,
    output tri1  id_1,
    output uwire id_2,
    input  tri   sample,
    input  uwire id_4,
    input  tri0  id_5,
    output tri   id_6,
    output tri0  id_7,
    input  wand  id_8,
    output wor   id_9,
    input  tri0  module_0,
    output tri   id_11,
    input  tri0  id_12,
    input  tri0  id_13,
    input  uwire id_14,
    input  tri   id_15,
    output tri   id_16,
    output uwire id_17
);
  wand id_19 = 1;
  wand id_20 = 1'b0;
  id_21(
      .id_0(id_3 > 1), .id_1(1 - 1), .id_2(id_15), .id_3(id_7 == id_12), .id_4(1 - 1'h0), .id_5()
  );
  wire id_22;
endmodule
module module_1 (
    input  wor  id_0,
    output wire id_1,
    input  wor  id_2,
    output wand id_3,
    input  wire id_4,
    output wire id_5
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3,
      id_4,
      id_0,
      id_2,
      id_3,
      id_5,
      id_2,
      id_5,
      id_4,
      id_1,
      id_2,
      id_0,
      id_4,
      id_4,
      id_5,
      id_3
  );
  assign modCall_1.id_6 = 0;
endmodule
