// Seed: 3370543785
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output tri1 id_2,
    input wire id_3,
    input wire id_4,
    input wire id_5,
    output wire id_6,
    input tri0 id_7,
    input wand id_8,
    input uwire id_9,
    input tri0 id_10,
    input wor id_11,
    output supply1 id_12,
    output wire id_13,
    input wor id_14,
    input supply0 id_15,
    input supply0 id_16
);
  assign id_12 = 1;
endmodule
macromodule module_1 (
    output logic id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output wor id_4,
    output wire id_5,
    output wand id_6,
    input tri0 id_7,
    input uwire id_8,
    output tri id_9
);
  always id_0 = #1  (1 !== 1'b0);
  assign id_9 = 1;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_7,
      id_7,
      id_1,
      id_6,
      id_8,
      id_3,
      id_8,
      id_3,
      id_8,
      id_6,
      id_4,
      id_8,
      id_3,
      id_3
  );
  assign modCall_1.type_10 = 0;
endmodule
