// Seed: 3257260493
module module_0 (
    output tri  id_0,
    input  tri0 id_1,
    output wand id_2,
    output tri  id_3,
    output tri0 id_4,
    input  tri  id_5,
    output wor  id_6,
    input  wand id_7,
    input  tri1 id_8,
    output wor  id_9,
    output tri  id_10,
    input  tri0 id_11
);
  reg  id_13;
  wire id_14, id_15 = -1;
  always_ff begin : LABEL_0
    disable id_16;
    id_13 <= id_16;
  end
  initial $display(id_14, 1, -1, 1);
  wire id_17;
  assign module_1.type_7 = 0;
endmodule
macromodule module_1 (
    input  tri0  id_0,
    output logic id_1,
    input  wand  id_2,
    output wand  id_3,
    input  tri   id_4
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_4
  );
  initial id_1 <= -1 ? 1 : 1;
endmodule
