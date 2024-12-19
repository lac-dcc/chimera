// Seed: 2901399090
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wand id_2,
    input supply0 id_3,
    input wand id_4,
    output wand id_5
);
  wire id_7;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input tri1 id_2,
    output tri1 id_3,
    output tri0 id_4,
    input tri id_5,
    output tri id_6,
    output wire id_7,
    input supply1 id_8,
    input tri id_9,
    output logic id_10,
    output wire id_11,
    output wor id_12,
    output wire id_13
);
  supply0 id_15;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_4,
      id_5,
      id_9,
      id_4
  );
  assign id_15 = 1;
  always @* begin : LABEL_0
    id_10 = #id_16 1;
  end
endmodule
