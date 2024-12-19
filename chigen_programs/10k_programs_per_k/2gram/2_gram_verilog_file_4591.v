// Seed: 3049343717
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    output wand id_2,
    output tri0 id_3,
    output uwire id_4,
    output uwire id_5,
    input supply0 id_6,
    input wire id_7,
    output supply1 id_8,
    input tri0 id_9,
    output uwire id_10,
    input wire id_11,
    output wor id_12,
    input tri0 id_13,
    input uwire id_14,
    output wor id_15
);
  assign id_2 = 1'b0;
endmodule
module module_1 (
    input logic id_0,
    input uwire id_1,
    input tri1 id_2,
    output wire id_3,
    input tri id_4,
    input tri1 id_5,
    output tri id_6,
    input supply1 id_7,
    output logic id_8
);
  always id_8 = #1 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_6,
      id_3,
      id_3,
      id_3,
      id_5,
      id_1,
      id_3,
      id_2,
      id_6,
      id_5,
      id_3,
      id_1,
      id_1,
      id_6
  );
  assign modCall_1.type_19 = 0;
  assign id_8 = id_0;
  wire id_10;
  wire id_11;
endmodule
