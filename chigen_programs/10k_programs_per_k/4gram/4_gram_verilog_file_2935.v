// Seed: 2100728946
module module_0 (
    input wor id_0,
    output tri id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    input wor id_6,
    input supply1 id_7,
    input uwire id_8,
    output wor id_9,
    input tri1 id_10,
    output wand id_11
);
  assign id_1 = 1;
  wire id_13;
endmodule
module module_1 (
    input  tri1  id_0,
    output logic id_1,
    output wire  id_2,
    input  wand  id_3,
    output uwire id_4,
    input  logic id_5,
    input  wor   id_6
);
  generate
    initial begin : LABEL_0
      id_1 <= id_5;
    end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_0,
      id_3,
      id_2,
      id_6,
      id_0,
      id_0,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
