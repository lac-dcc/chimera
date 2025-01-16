// Seed: 2904838937
module module_0 (
    input uwire id_0,
    output wand id_1,
    input uwire id_2,
    input tri1 id_3,
    input tri0 id_4,
    output wand id_5,
    input supply1 id_6,
    input tri id_7,
    input tri id_8,
    input tri1 id_9,
    input wand id_10,
    input supply1 id_11,
    input tri0 id_12,
    input tri1 id_13,
    id_19,
    output wor id_14,
    output wor id_15,
    input wire id_16,
    output uwire id_17
);
  assign id_14 = id_2;
  parameter id_20 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input wor id_2,
    input wor id_3,
    input wor id_4,
    input supply0 id_5,
    input tri1 id_6,
    output logic id_7,
    output wire id_8
);
  wire id_10, id_12, id_13;
  module_0 modCall_1 (
      id_4,
      id_8,
      id_3,
      id_4,
      id_5,
      id_8,
      id_4,
      id_6,
      id_1,
      id_0,
      id_0,
      id_1,
      id_4,
      id_6,
      id_8,
      id_8,
      id_4,
      id_8
  );
  assign modCall_1.id_15 = 0;
  always id_7 <= 1;
endmodule
