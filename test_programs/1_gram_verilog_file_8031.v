// Seed: 3406205928
module module_0 (
    input wor id_0,
    input uwire id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wor id_4,
    input tri1 id_5,
    output supply0 id_6,
    output supply0 id_7,
    input uwire id_8,
    output wor id_9,
    input uwire id_10,
    output tri0 id_11,
    input wand id_12,
    input wor id_13,
    output supply1 id_14,
    input tri0 id_15,
    output tri0 id_16,
    output supply0 id_17,
    output wor id_18,
    input tri1 id_19,
    id_21
);
  always_latch begin : LABEL_0
  end
  always id_14 = id_0;
  assign id_6 = -1;
  for (id_22 = id_5; 1; id_17 = -1) assign id_11 = id_4;
  wire id_23;
endmodule
module module_1 (
    output wire  id_0,
    input  uwire id_1
);
  uwire id_3, id_4, id_5, id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_4,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_6,
      id_6,
      id_0,
      id_1,
      id_4,
      id_4,
      id_5,
      id_0,
      id_5,
      id_3,
      id_4
  );
  assign modCall_1.id_4 = 0;
  assign id_0 = id_5;
  for (id_7 = 1; id_4; id_5 = id_5) assign id_3 = id_1;
endmodule
