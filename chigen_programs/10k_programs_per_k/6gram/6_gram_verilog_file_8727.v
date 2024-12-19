// Seed: 3569269313
module module_0 (
    output wor   id_0,
    output wand  id_1,
    input  uwire id_2,
    input  wire  id_3,
    input  uwire id_4,
    input  tri1  id_5,
    input  wand  id_6,
    input  uwire id_7,
    input  tri   id_8,
    input  wand  id_9,
    input  wor   id_10,
    input  wire  id_11
);
  id_13(
      .id_0((id_3)), .id_1(id_3), .id_2(1)
  );
  wire id_14;
  wire id_15;
  always disable id_16;
endmodule
module module_1 (
    input  logic id_0,
    output tri0  id_1,
    output logic id_2,
    input  tri   id_3,
    output logic id_4
);
  initial begin : LABEL_0
    id_1 = 1;
    id_4 = id_0;
    id_4 = id_0;
    id_2 <= id_0;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_9 = 0;
endmodule
