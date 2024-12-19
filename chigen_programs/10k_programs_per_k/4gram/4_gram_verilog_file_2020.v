// Seed: 2400469374
module module_0 (
    input wand id_0,
    input wor id_1,
    output tri id_2,
    output wor id_3,
    input wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    input uwire id_7,
    input supply0 id_8,
    input uwire id_9,
    input supply0 id_10,
    output supply0 id_11,
    input supply1 id_12,
    input supply0 id_13,
    input tri1 id_14,
    input supply1 id_15,
    input tri1 id_16
);
  wire id_18;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    input wand id_2,
    output logic id_3,
    input logic id_4,
    input tri id_5,
    output tri1 id_6
);
  wor id_8 = 1'b0;
  always disable id_9;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_6,
      id_6,
      id_5,
      id_5,
      id_5,
      id_0,
      id_0,
      id_2,
      id_5,
      id_6,
      id_5,
      id_0,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_13 = 0;
  assign id_3 = id_4;
  wire id_10;
  always id_1 = #(1) id_4;
endmodule
