// Seed: 121921505
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input wand id_2,
    input tri0 id_3,
    output wand id_4,
    input uwire id_5,
    output wire id_6,
    output tri id_7,
    input supply1 id_8,
    input supply0 id_9,
    output wor id_10,
    input wire id_11#(
        .id_16(1),
        .id_17(1'b0)
    ),
    output supply0 id_12,
    output wor id_13,
    output tri0 id_14
);
  assign id_16 = id_5;
  assign id_12 = id_3;
  wor [-1 : 1] id_18 = 1;
endmodule
module module_1 (
    output logic id_0,
    output wire  id_1,
    input  wand  id_2
);
  always id_0 <= 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_12 = 0;
endmodule
