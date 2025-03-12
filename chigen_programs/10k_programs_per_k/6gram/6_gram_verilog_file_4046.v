// Seed: 271866417
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input tri id_2,
    input wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    output tri0 id_6,
    input wand id_7,
    input tri0 id_8,
    input wor id_9,
    input supply0 id_10,
    input tri0 id_11,
    input tri0 id_12,
    input wand id_13,
    input uwire id_14,
    input supply1 id_15
);
  wire  id_17;
  wire  id_18;
  logic id_19;
endmodule
module module_1 (
    output logic id_0,
    input wire id_1,
    output tri id_2,
    input supply1 id_3
);
  wire id_5, id_6 = id_6;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.id_8 = 0;
  integer id_7;
  always @(negedge id_6) id_0 = 1;
endmodule
