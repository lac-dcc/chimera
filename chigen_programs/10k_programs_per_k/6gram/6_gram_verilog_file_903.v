// Seed: 1559322142
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input tri1 id_2,
    output wor id_3,
    input uwire id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri id_7
);
  assign id_0 = id_1;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    input tri id_2,
    input wor id_3,
    input supply0 id_4,
    output wand id_5,
    input uwire id_6,
    input wand id_7,
    output supply0 id_8,
    input supply0 id_9,
    input wor id_10,
    input uwire id_11,
    input uwire id_12,
    input wire id_13,
    input uwire id_14,
    input tri0 id_15,
    output tri0 id_16,
    output tri0 id_17
);
  integer id_19, id_20, id_21;
  integer id_22 = id_6;
  reg id_23;
  always @(id_22) begin : LABEL_0
    id_21 = 1;
    if (id_12) $display(1, id_10, 1);
    id_23 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_11,
      id_2,
      id_22,
      id_11,
      id_12,
      id_13,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
