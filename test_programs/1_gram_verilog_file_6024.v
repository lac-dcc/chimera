// Seed: 3470263674
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wor id_5,
    output tri0 id_6,
    input wire id_7,
    id_21,
    input wand id_8,
    input wor id_9,
    input tri0 id_10,
    output wire id_11,
    input supply0 id_12,
    output tri id_13,
    input tri1 id_14,
    id_22,
    input uwire id_15,
    input wire id_16,
    output wand id_17,
    input tri0 id_18,
    id_23,
    input supply0 id_19
);
  initial id_21 <= #id_10 1;
  wire id_24;
  wire id_25, id_26;
endmodule
module module_1 (
    output tri1 id_0,
    input tri1 id_1,
    output logic id_2,
    output supply0 id_3,
    output tri1 id_4,
    input wor id_5,
    output supply0 id_6
);
  parameter id_8 = id_8;
  always begin : LABEL_0
    if (1) id_6 = id_5;
    id_2 <= -1;
  end
  wire id_9;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_1,
      id_5,
      id_3,
      id_6,
      id_1,
      id_5,
      id_5,
      id_1,
      id_0,
      id_5,
      id_6,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1,
      id_5
  );
  assign modCall_1.id_4 = 0;
  wire id_10;
endmodule
