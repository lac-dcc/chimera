// Seed: 4262186991
module module_0 (
    input supply1 id_0,
    output wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    output uwire id_4,
    output tri1 id_5,
    input wire id_6,
    input tri0 id_7,
    input supply0 id_8,
    input wire id_9
);
  wire id_11;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    output wor   id_1,
    output wand  id_2,
    output logic id_3,
    input  tri   id_4,
    input  tri0  id_5,
    input  tri0  id_6,
    input  uwire id_7,
    input  tri0  id_8
);
  parameter id_10 = 1;
  logic id_11, id_12, id_13;
  generate
    always @(posedge 1 or id_6 + id_10 && !id_8 && id_13) id_3 = id_11;
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_2,
      id_7,
      id_2,
      id_1,
      id_1,
      id_6,
      id_8,
      id_5,
      id_7
  );
endmodule
