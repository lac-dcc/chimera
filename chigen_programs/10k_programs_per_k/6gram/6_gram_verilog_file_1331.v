// Seed: 323984373
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input wire id_2,
    input supply0 id_3,
    input tri id_4,
    output supply1 id_5,
    input wire id_6,
    output tri1 id_7,
    input tri0 id_8,
    output wand id_9,
    input tri id_10,
    input wire id_11,
    output wor id_12,
    input tri1 id_13,
    input supply1 id_14
);
  always disable id_16;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    input supply0 id_2
    , id_6,
    input wor id_3,
    output tri1 id_4
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_0,
      id_2,
      id_3,
      id_4,
      id_0,
      id_4,
      id_2,
      id_4,
      id_3,
      id_2,
      id_4,
      id_0,
      id_2
  );
  always @(negedge 1) id_1 <= #id_7 1 != {1, 1};
endmodule
