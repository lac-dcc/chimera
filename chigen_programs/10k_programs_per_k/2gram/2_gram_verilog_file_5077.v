// Seed: 2363634758
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wand id_2,
    output supply0 id_3,
    input tri id_4,
    output wor id_5,
    output supply1 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input wand id_9,
    input wor id_10,
    input supply0 id_11,
    input tri id_12
);
  assign id_3 = 1;
  always begin : LABEL_0
    wait (1'b0);
  end
endmodule
module module_1 (
    output supply0 id_0,
    inout wor id_1,
    input tri0 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    inout supply1 id_6,
    output wor id_7,
    output wor id_8,
    input tri1 id_9,
    input tri0 id_10,
    output wire id_11,
    input supply0 id_12,
    output tri1 id_13,
    input wand id_14,
    input supply1 id_15,
    input tri1 id_16,
    output wor id_17,
    output wire id_18,
    output tri id_19,
    input uwire id_20,
    input tri0 id_21,
    input wand id_22
);
  module_0 modCall_1 (
      id_20,
      id_11,
      id_20,
      id_6,
      id_4,
      id_0,
      id_13,
      id_20,
      id_6,
      id_9,
      id_14,
      id_21,
      id_4
  );
  assign modCall_1.type_3 = 0;
  nand primCall (
      id_7,
      id_4,
      id_6,
      id_10,
      id_12,
      id_2,
      id_21,
      id_16,
      id_14,
      id_9,
      id_1,
      id_5,
      id_22,
      id_20,
      id_15
  );
endmodule
