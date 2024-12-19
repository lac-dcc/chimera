// Seed: 2204047259
module module_0 (
    input  wor   id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  wor   id_3,
    input  tri   id_4,
    input  wire  id_5,
    input  wor   id_6,
    output wor   id_7,
    input  wand  id_8,
    output uwire id_9
);
  assign module_1.type_6 = 0;
  assign id_7 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    output wor id_2,
    input tri1 id_3,
    output wire id_4,
    input wor id_5,
    input wire id_6,
    output uwire id_7,
    output logic id_8,
    output uwire id_9,
    output tri0 id_10,
    input supply1 id_11,
    output tri id_12,
    input wor id_13
);
  initial begin : LABEL_0
    id_8 <= ~id_3;
  end
  wire id_15;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_11,
      id_13,
      id_1,
      id_0,
      id_0,
      id_4,
      id_1,
      id_12
  );
endmodule
