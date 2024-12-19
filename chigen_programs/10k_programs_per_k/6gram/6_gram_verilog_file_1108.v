// Seed: 35471532
module module_0 (
    input wor id_0,
    output wand id_1,
    output tri0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input uwire id_8,
    output wor id_9,
    input uwire id_10,
    input supply0 id_11,
    input uwire id_12,
    input wor id_13
);
  assign id_2 = id_0;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    output tri id_2,
    input wand id_3,
    input uwire id_4,
    input tri id_5,
    output wor id_6,
    input supply1 id_7,
    input tri1 id_8,
    output uwire id_9,
    output tri1 id_10,
    input tri0 id_11,
    input supply0 id_12,
    output tri id_13,
    input wand id_14,
    output tri1 id_15
);
  module_0 modCall_1 (
      id_14,
      id_10,
      id_2,
      id_10,
      id_5,
      id_3,
      id_11,
      id_4,
      id_14,
      id_15,
      id_12,
      id_8,
      id_7,
      id_11
  );
  assign modCall_1.id_12 = 0;
  always @(negedge 1) begin : LABEL_0
    id_1 <= (1);
  end
endmodule
