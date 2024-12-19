// Seed: 2155736067
module module_0 (
    output tri0 id_0,
    input tri id_1,
    output tri id_2,
    output uwire id_3,
    output wor id_4,
    input tri1 id_5,
    input supply0 id_6,
    input tri0 id_7,
    input uwire id_8,
    input wor id_9,
    output tri id_10,
    input wand id_11,
    input tri0 id_12,
    output tri id_13,
    output wor id_14,
    output supply1 id_15
);
  always @(negedge id_6) id_15 = id_5;
  assign id_3 = id_5;
  wire id_17;
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    output supply0 id_2,
    output wor id_3,
    input tri0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_4,
      id_4,
      id_4,
      id_0,
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.type_7 = 0;
endmodule
