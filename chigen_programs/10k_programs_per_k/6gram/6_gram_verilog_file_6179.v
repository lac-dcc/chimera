// Seed: 1604383318
module module_0 (
    input supply0 id_0,
    input tri id_1,
    output supply1 id_2,
    output uwire id_3,
    output uwire id_4,
    input uwire id_5,
    input wor id_6,
    input wor id_7,
    input wire id_8
    , id_29,
    input wire id_9,
    output tri id_10,
    output tri1 id_11,
    input supply1 id_12,
    input tri1 id_13,
    input tri id_14,
    output wand id_15,
    input supply0 id_16,
    input wand id_17,
    input uwire id_18,
    output uwire id_19,
    input tri id_20,
    input wand id_21,
    input wire id_22,
    input wor id_23,
    input supply0 id_24,
    output supply1 id_25,
    input wand id_26,
    output supply1 id_27
);
  wire id_30, id_31;
  initial #(id_30) id_29 = id_7;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    output supply1 id_2,
    output logic id_3,
    output wand id_4
);
  initial begin : LABEL_0
    if (id_1) id_3 <= 1;
  end
  wire id_6;
  assign id_2 = (1);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_4,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1,
      id_1,
      id_0,
      id_4,
      id_0,
      id_0,
      id_1,
      id_4,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_4,
      id_1,
      id_4
  );
  assign modCall_1.id_18 = 0;
endmodule
