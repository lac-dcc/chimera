// Seed: 1013528500
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input wand id_2,
    input supply1 id_3,
    input wand id_4,
    output wor id_5,
    input supply0 id_6
);
endmodule
module module_1 (
    output wor id_0,
    output wire id_1,
    input logic id_2,
    output wor id_3,
    output logic id_4,
    output logic id_5,
    input supply0 id_6
);
  always @* begin : LABEL_0
    id_4 <= id_2;
    id_5 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_6,
      id_6,
      id_0,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output wor id_0,
    output supply1 id_1,
    output tri0 id_2,
    output wor id_3,
    input tri0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.type_2 = 0;
endmodule
