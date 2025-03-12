// Seed: 3336579130
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input uwire id_2,
    input wand id_3,
    output wand id_4,
    output tri id_5,
    output supply1 id_6,
    input tri id_7,
    input tri id_8,
    output wor id_9,
    output wire id_10,
    input uwire id_11,
    output wire id_12
);
  assign id_10 = 1 | -1 * id_11 - 1'b0;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input wor id_2,
    input supply0 id_3,
    input supply1 id_4,
    output logic id_5,
    output wand id_6,
    output supply1 id_7,
    output tri1 id_8
);
  initial begin : LABEL_0
    id_5 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_8,
      id_8,
      id_6,
      id_0,
      id_3,
      id_6,
      id_8,
      id_0,
      id_7
  );
endmodule
