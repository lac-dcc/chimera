// Seed: 769014277
macromodule module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri1 id_3,
    output uwire id_4,
    output wire id_5,
    input supply1 id_6,
    output wand id_7,
    input tri0 id_8,
    input tri0 id_9
);
  assign id_5 = id_8;
  assign id_3 = 1;
  wire id_11 = id_2;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input uwire id_3,
    input supply1 id_4,
    input wor id_5,
    output logic id_6,
    output tri id_7,
    output tri1 id_8,
    output tri1 id_9,
    input tri id_10,
    output tri id_11,
    id_21,
    input tri1 id_12,
    input uwire id_13,
    input tri id_14,
    input tri id_15,
    input tri id_16,
    input logic id_17,
    input wor id_18,
    output tri id_19
);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_14,
      id_8,
      id_19,
      id_8,
      id_14,
      id_0,
      id_14,
      id_16
  );
  assign modCall_1.type_0 = 0;
  final id_6 <= id_15 === 1 - 1 ? id_17 : -1;
  nor primCall (id_7, id_1, id_17, id_14, id_13, id_3, id_12, id_5, id_21, id_18);
  parameter id_22 = -1;
endmodule
