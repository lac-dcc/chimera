// Seed: 943199555
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input wor id_2,
    input wand id_3,
    output tri0 id_4,
    output tri0 id_5,
    input wand id_6,
    output tri1 id_7,
    input wor id_8,
    input tri0 id_9
);
  generate
    always begin : LABEL_0
      id_7 = 1;
    end
  endgenerate
  assign module_1.type_0 = 0;
  wire id_11;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output wire id_2,
    input wand id_3,
    input tri id_4,
    output tri1 id_5,
    input wor id_6,
    input tri id_7
);
  module_0 modCall_1 (
      id_7,
      id_0,
      id_4,
      id_0,
      id_2,
      id_5,
      id_1,
      id_5,
      id_3,
      id_3
  );
endmodule
