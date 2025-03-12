// Seed: 3482574735
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  wor   id_3,
    input  uwire id_4,
    output wor   id_5,
    input  tri   id_6,
    output tri   id_7
);
  initial begin : LABEL_0
    $signed(16);
    ;
  end
  assign id_7 = id_2;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    output logic id_4,
    input wor id_5,
    input tri id_6,
    input tri0 id_7
    , id_19,
    output logic id_8,
    input wand id_9,
    input wire id_10,
    output supply0 id_11,
    output logic id_12,
    input tri0 id_13,
    input wire id_14,
    output supply1 id_15,
    input tri1 id_16,
    input wand id_17
);
  final begin : LABEL_0
    id_12 <= -1;
    if (1 & ~1) id_4 = id_13;
    else id_8 <= id_7;
  end
  module_0 modCall_1 (
      id_2,
      id_10,
      id_6,
      id_5,
      id_3,
      id_11,
      id_17,
      id_11
  );
  assign modCall_1.id_0 = 0;
endmodule
