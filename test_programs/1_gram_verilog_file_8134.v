// Seed: 1027407472
module module_0 (
    output wand id_0,
    input wor id_1,
    output tri0 id_2,
    input tri0 id_3,
    output wire id_4,
    input wor id_5,
    output wor id_6,
    output supply0 id_7,
    input tri0 id_8,
    input tri0 id_9,
    output wand id_10
);
  assign id_2 = id_8 || id_1;
endmodule
module module_1 (
    inout logic id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    output wire id_4,
    input tri0 id_5,
    output tri0 id_6,
    input logic id_7,
    output tri id_8,
    output logic id_9,
    input wand id_10,
    output logic id_11,
    input wand id_12,
    input uwire id_13,
    input tri0 id_14,
    input supply1 id_15
);
  integer id_17 = id_5;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_5,
      id_4,
      id_5,
      id_8,
      id_4,
      id_17,
      id_15,
      id_17
  );
  assign modCall_1.id_7 = 0;
  assign id_4 = 1 == 1;
  reg id_18;
  bit id_19, id_20;
  always_comb begin : LABEL_0
    id_9  <= id_18;
    id_11 <= id_19;
  end
  assign id_0 = 1;
  assign id_4 = -1;
  always id_0 <= id_7;
endmodule
