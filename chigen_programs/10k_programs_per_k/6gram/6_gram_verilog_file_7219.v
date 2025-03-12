// Seed: 2101371252
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input wor id_2,
    output wor module_0,
    input wire id_4,
    input tri1 id_5,
    input wand id_6,
    output tri0 id_7
);
  wire id_9;
  assign {1, 1, id_6} = id_0;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    input wor id_2,
    inout uwire id_3,
    input wire id_4,
    input supply0 id_5,
    input wand id_6,
    input wire id_7,
    inout supply1 id_8,
    output supply1 id_9,
    input tri0 id_10,
    input wor id_11,
    input tri1 id_12,
    output wor id_13,
    output supply1 id_14,
    input wand id_15,
    input tri id_16,
    input wire id_17,
    output tri0 id_18,
    output supply1 id_19,
    output tri id_20
);
  wire id_22;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_2,
      id_19,
      id_11,
      id_11,
      id_4,
      id_3
  );
  assign modCall_1.id_6 = 0;
  always @(-1'b0) id_1 = #1 id_2;
endmodule
