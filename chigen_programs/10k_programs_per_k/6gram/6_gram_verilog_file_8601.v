// Seed: 2635987868
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    input uwire id_3,
    input tri id_4,
    input uwire id_5
    , id_13,
    input wor id_6,
    input supply0 id_7,
    input wand id_8,
    output tri id_9,
    input tri1 id_10,
    input supply0 id_11
);
  wor id_14;
  assign id_14 = id_1 ? 1 : 1 ? 1 : 1;
  initial $display(1'b0 - id_14, id_1);
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    input  wand  id_2,
    output logic id_3,
    input  uwire id_4,
    output wor   id_5
);
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2,
      id_5,
      id_4,
      id_1
  );
  always
    if (1);
    else id_3 <= 1'b0 ? 1 + id_0 - id_4 - 1 : 1;
endmodule
