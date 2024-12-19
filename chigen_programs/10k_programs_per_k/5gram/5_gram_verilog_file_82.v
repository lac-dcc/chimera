// Seed: 2123897748
module module_0 (
    input tri id_0,
    output wor id_1,
    input tri0 id_2,
    output wor id_3,
    input tri1 id_4,
    input wand id_5,
    input uwire id_6,
    output tri1 id_7,
    input uwire id_8,
    output supply1 id_9,
    output wor id_10,
    output wor id_11,
    output supply1 id_12,
    input wire id_13,
    output tri1 id_14,
    output uwire id_15,
    input supply1 id_16,
    output wor id_17,
    output supply1 id_18,
    input supply1 id_19
);
  wire id_21;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    input  tri  id_1,
    output tri1 id_2,
    output tri  id_3
);
  assign id_3 = id_0;
  wand id_5;
  always_comb @(1 or id_5) begin : LABEL_0
    id_2 = 1 == 1'd0;
    id_3 = 1;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_3,
      id_0,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_3,
      id_0,
      id_3,
      id_2,
      id_1,
      id_3,
      id_2,
      id_0
  );
endmodule
