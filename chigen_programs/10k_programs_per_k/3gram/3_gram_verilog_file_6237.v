// Seed: 304952808
module module_0;
  reg [1 : -1  |  -1] id_1;
  reg id_2;
  always_ff @(1) begin : LABEL_0
    id_2 = id_1 * -1;
    id_1 = -1;
    begin : LABEL_1
      id_2 = id_1;
    end
  end
endmodule
module module_1 #(
    parameter id_17 = 32'd16
) (
    output tri0 id_0,
    input tri0 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input uwire id_4,
    output supply0 id_5,
    input tri1 id_6,
    output wor id_7,
    output uwire id_8,
    input supply1 id_9,
    output tri id_10
    , id_27,
    output wand id_11,
    input wor id_12,
    output tri1 id_13,
    input supply0 id_14,
    output wire id_15,
    input supply0 id_16,
    input wor _id_17,
    input wor id_18,
    output supply0 id_19,
    input wor id_20,
    input tri0 id_21,
    input uwire id_22,
    input wor id_23,
    input uwire id_24,
    output supply0 id_25
    , id_28
);
  assign id_28[id_17] = 1 & -1 & id_20 & id_27;
  or primCall (
      id_0,
      id_1,
      id_12,
      id_14,
      id_16,
      id_18,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_27,
      id_28,
      id_3,
      id_4,
      id_6,
      id_9
  );
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
