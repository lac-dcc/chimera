// Seed: 1899004053
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wire id_7,
    output tri0 id_8,
    input tri id_9,
    input uwire id_10,
    input uwire id_11,
    output wire id_12,
    input supply1 id_13,
    input supply1 id_14,
    output supply0 id_15,
    input supply0 id_16,
    input wor id_17,
    input tri0 id_18,
    output wire id_19,
    input wor id_20,
    output wand id_21,
    output supply0 id_22
    , id_33,
    input wand id_23,
    output tri id_24,
    output tri1 id_25
    , id_34,
    input supply1 id_26,
    input tri1 id_27,
    output wire id_28,
    output wire id_29,
    input supply1 id_30,
    input tri id_31
);
endmodule
module module_1 #(
    parameter id_5 = 32'd39,
    parameter id_6 = 32'd92
) (
    input  tri1 id_0,
    input  wire id_1,
    output tri1 id_2
);
  reg id_4;
  defparam id_5.id_6 = 1'b0;
  or primCall (id_2, id_4, id_1, id_0);
  always @(negedge 1) begin : LABEL_0
    id_4 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.type_37 = 0;
endmodule
