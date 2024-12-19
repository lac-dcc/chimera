// Seed: 334412623
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output wor id_2,
    input tri0 id_3,
    output supply1 id_4,
    output supply1 id_5,
    input tri id_6,
    output tri0 id_7
);
  assign id_2 = 1;
  tri0 id_9 = id_6;
  wire id_10;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri1 id_4,
    output wire id_5,
    output wor id_6,
    output tri1 id_7,
    input wor id_8,
    input wor id_9,
    input tri id_10,
    input tri0 id_11,
    output tri0 id_12
);
  always @(negedge 1 or posedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  integer id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_5,
      id_6,
      id_11,
      id_5
  );
  assign modCall_1.type_11 = 0;
endmodule
