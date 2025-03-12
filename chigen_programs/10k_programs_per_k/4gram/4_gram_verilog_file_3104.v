// Seed: 853573686
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    output supply1 id_2,
    output wand id_3,
    output tri1 id_4,
    input uwire id_5,
    input wire id_6,
    output uwire id_7,
    output wire id_8,
    input supply0 id_9,
    output supply0 id_10,
    input wire id_11,
    output tri1 id_12,
    output supply0 id_13,
    input wire id_14,
    input wor id_15,
    input wire id_16,
    input wand id_17,
    input wor id_18,
    input uwire id_19
);
  assign id_2 = id_11;
endmodule
module module_1 (
    output logic id_0,
    input  tri0  id_1,
    output uwire id_2,
    input  wor   id_3
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_9 = 0;
  initial forever id_0 = 1;
  assign id_2 = "" & ~"" & id_3;
endmodule
