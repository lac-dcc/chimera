// Seed: 1383972764
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input wand id_2,
    output supply0 id_3,
    output tri1 id_4,
    output tri id_5,
    input uwire id_6
);
  logic id_8;
  assign id_5 = id_0;
  assign id_8 = id_2;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output wire id_2,
    input wire id_3,
    input tri0 id_4,
    input wor id_5,
    output logic id_6,
    output tri0 id_7,
    output supply0 id_8,
    output tri1 id_9,
    output wand id_10,
    output uwire id_11,
    input tri0 id_12,
    input wor id_13,
    output supply1 id_14
);
  wire id_16;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_0,
      id_10,
      id_9,
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
  initial @(negedge id_4 - id_12);
  always begin : LABEL_0
    id_6 = id_3;
  end
endmodule
