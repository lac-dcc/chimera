// Seed: 2147131884
module module_0 (
    output wand id_0,
    input tri id_1,
    output uwire id_2,
    input wire id_3,
    output wor id_4,
    input supply0 id_5,
    input supply1 id_6
    , id_20,
    input wand id_7,
    output uwire id_8,
    input wor id_9,
    output wor id_10,
    input uwire id_11,
    input uwire id_12,
    input uwire id_13,
    output supply0 id_14,
    input tri id_15,
    input tri id_16,
    input supply1 id_17,
    input supply1 id_18
);
  wire id_21;
  wire id_22;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input wand id_2,
    input tri id_3,
    output tri1 id_4,
    input wor id_5,
    output tri id_6
);
  reg id_8;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_0,
      id_6,
      id_1,
      id_5,
      id_5,
      id_6,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_4,
      id_2,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
  always @(posedge 1 ~^ id_0 or posedge 1 & id_3) begin : LABEL_0
    id_8 <= 1'h0;
  end
endmodule
