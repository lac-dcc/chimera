// Seed: 3391447678
module module_0 (
    input wor   id_0,
    input uwire id_1,
    input uwire id_2,
    input wor   id_3,
    input uwire id_4
);
  wire id_6;
endmodule
macromodule module_1 (
    input supply1 id_0,
    input tri1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output wand id_4,
    input wor id_5,
    output tri0 id_6,
    output logic id_7,
    input tri1 id_8
);
  initial id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output supply0 id_0,
    output wand id_1,
    output tri0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output wand id_6,
    output wire id_7,
    output tri0 id_8
);
  wire [1 : -1] id_10;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  wire id_11;
  parameter id_12 = &1;
endmodule
