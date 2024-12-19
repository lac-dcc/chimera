// Seed: 1600092906
module module_0 (
    output supply0 id_0
    , id_13,
    input wire id_1,
    input tri0 id_2,
    input wor id_3,
    input tri1 id_4,
    input tri0 id_5,
    input wire id_6,
    input wor id_7,
    output supply0 id_8,
    input supply1 id_9,
    input tri id_10,
    output supply1 id_11
);
  assign id_0 = 1;
  assign module_1.type_1 = 0;
  assign id_0 = 1;
endmodule
macromodule module_1 (
    input  wire  id_0,
    output wand  id_1,
    output tri   id_2,
    input  uwire id_3,
    output uwire id_4,
    output wire  id_5
    , id_8,
    output uwire id_6
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_6,
      id_3,
      id_0,
      id_5
  );
  initial begin : LABEL_0
    id_5 = 1;
  end
  always_latch @(posedge id_3 or posedge id_0);
endmodule
