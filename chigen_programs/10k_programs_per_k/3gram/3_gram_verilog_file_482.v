// Seed: 3509834122
module module_0 (
    input supply0 id_0,
    output wand id_1
    , id_8,
    input supply1 id_2,
    output wand id_3,
    output wand id_4,
    input tri id_5,
    input tri id_6
);
  assign id_1 = id_5 == id_8;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    output tri id_2,
    input wor id_3,
    output wor id_4,
    input supply1 id_5
);
  always @(id_5) begin : LABEL_0
    id_1 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_0,
      id_4,
      id_2,
      id_3,
      id_3
  );
endmodule
