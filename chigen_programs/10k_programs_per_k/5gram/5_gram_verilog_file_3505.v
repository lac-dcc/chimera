// Seed: 3457147962
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    input tri id_2,
    input wire id_3,
    input wire id_4,
    output tri1 id_5,
    input tri id_6,
    input tri0 id_7,
    input supply1 id_8,
    input wire id_9,
    input wire id_10,
    input wire id_11,
    input wor id_12,
    output supply1 id_13,
    output tri id_14,
    output wand id_15
);
  wire id_17;
  assign id_14 = id_17 ? 1 : {1, 1};
  integer id_18;
endmodule
module module_1 (
    output tri0 id_0,
    output tri id_1,
    input tri id_2,
    output uwire id_3,
    input tri1 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input wire id_7,
    output tri0 id_8
);
  assign id_1 = 1 ? id_2 == 1 < id_7 : id_2;
  tri1 id_10;
  always @(negedge id_2) id_10 = 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_6,
      id_4,
      id_5,
      id_6,
      id_4,
      id_7,
      id_2,
      id_7,
      id_2,
      id_2,
      id_1,
      id_8,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
