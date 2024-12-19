// Seed: 3963301284
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input supply0 id_2,
    input wire id_3,
    output wor id_4
);
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input tri1 id_2,
    input tri id_3,
    input supply1 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input wire id_8,
    input wand id_9,
    input wor id_10,
    output wor id_11,
    input tri1 id_12,
    input wire id_13,
    output uwire id_14,
    input wand id_15
);
  wire id_17;
  module_0 modCall_1 (
      id_14,
      id_8,
      id_3,
      id_12,
      id_11
  );
  assign modCall_1.id_3 = 0;
  tri id_18;
  always @(negedge id_13) id_18 = 1;
  wire id_19;
  wire id_20;
  wor  id_21 = 1'b0 + id_10;
  assign id_11 = 1;
endmodule
