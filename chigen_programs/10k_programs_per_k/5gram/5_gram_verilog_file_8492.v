// Seed: 2522545406
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    input wand id_3,
    input tri id_4,
    output supply1 id_5,
    input wand id_6
);
  always_comb @(id_3) begin : LABEL_0
    assign id_5 = 1;
    id_5 = id_1 == 1;
  end
  assign id_5 = id_2;
  wire id_8;
  wire id_9;
endmodule
module module_1 #(
    parameter id_42 = 32'd41,
    parameter id_43 = 32'd21
) (
    output wand id_0,
    input uwire id_1
    , id_38,
    input wire id_2,
    output wor id_3,
    input tri0 id_4,
    input tri id_5,
    output wire id_6,
    output tri1 id_7,
    output wor id_8,
    input wor id_9,
    input wire id_10,
    output tri id_11,
    input tri id_12,
    input wand id_13,
    output supply0 id_14,
    output tri0 id_15,
    input uwire id_16,
    input wand id_17,
    input supply0 id_18,
    output wand id_19,
    input wand id_20,
    input tri id_21,
    output supply1 id_22,
    input tri id_23,
    input uwire id_24,
    input tri id_25,
    input tri0 id_26,
    output tri0 id_27,
    output tri0 id_28,
    output tri id_29,
    output tri0 id_30,
    input tri id_31,
    input tri0 id_32,
    input supply0 id_33,
    input uwire id_34
    , id_39,
    output wor id_35,
    output wire id_36
);
  wire id_40;
  wire id_41;
  always @(posedge 1'h0 or posedge id_17 == id_20) begin : LABEL_0
    id_38 <= 1;
  end
  module_0 modCall_1 (
      id_18,
      id_9,
      id_17,
      id_1,
      id_33,
      id_27,
      id_12
  );
  assign modCall_1.id_6 = 0;
  defparam id_42.id_43 = 1;
endmodule
