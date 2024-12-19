// Seed: 4185789612
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri0 id_3,
    output supply1 id_4,
    input wand id_5,
    input tri id_6,
    output tri id_7,
    input tri1 id_8,
    output wand id_9,
    output supply1 id_10
);
  tri0 id_12;
  tri1 id_13;
  final begin : LABEL_0
  end
  wor   id_14 = 1;
  wire  id_15;
  uwire id_16 = id_13 || id_12;
  assign module_1.type_8 = 0;
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    output tri0 id_0
    , id_14,
    input wor id_1,
    input tri1 id_2,
    input wor id_3,
    input uwire id_4,
    input supply0 id_5,
    output uwire id_6,
    output wor id_7,
    input tri1 id_8,
    input supply0 id_9,
    input supply0 id_10,
    output wor id_11,
    input logic id_12
);
  always id_14 = #id_15 id_12;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_4,
      id_4,
      id_11,
      id_4,
      id_2,
      id_11,
      id_1,
      id_6,
      id_0
  );
endmodule
