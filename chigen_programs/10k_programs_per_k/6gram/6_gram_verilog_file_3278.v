// Seed: 2238953612
module module_0 (
    output wand id_0,
    input uwire id_1,
    input tri1 id_2,
    output wor id_3,
    input uwire id_4,
    output supply1 id_5
);
  wire id_7;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    output wor id_6,
    input tri1 id_7,
    output supply0 id_8,
    output wor id_9,
    output wire id_10,
    input wand id_11,
    output tri id_12,
    input uwire id_13,
    output logic id_14,
    input uwire id_15,
    input wor id_16,
    output wor id_17,
    input tri id_18,
    input wand id_19,
    input supply1 id_20,
    output wand id_21
);
  always begin : LABEL_0
    id_9 = id_15;
    id_14 <= #1 1;
  end
  module_0 modCall_1 (
      id_2,
      id_16,
      id_1,
      id_8,
      id_0,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
