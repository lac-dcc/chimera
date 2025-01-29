// Seed: 2440441996
module module_0 (
    output wand id_0,
    input uwire id_1,
    input tri0 id_2,
    output supply0 id_3,
    input tri0 id_4,
    input wire id_5,
    input wire id_6,
    output wire id_7,
    input tri1 id_8,
    input wor id_9,
    input supply1 id_10,
    output wire id_11
);
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    output supply1 id_2,
    input tri id_3,
    output wor id_4,
    output tri0 id_5,
    output logic id_6,
    output tri1 id_7
);
  wire id_9, id_10, id_11;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_7,
      id_3,
      id_1,
      id_3,
      id_7,
      id_3,
      id_3,
      id_1,
      id_7
  );
  assign modCall_1.type_17 = 0;
  id_12(
      1 ? -1'b0 : 1, id_4
  );
  always id_6 <= 1;
endmodule
