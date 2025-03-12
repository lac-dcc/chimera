// Seed: 1873562538
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input wor id_2,
    input tri1 id_3,
    input supply0 id_4,
    output tri1 id_5,
    output tri1 id_6,
    output wor id_7,
    output supply0 id_8,
    input wor id_9,
    input uwire id_10,
    output wor id_11,
    output uwire id_12,
    output wire id_13,
    input uwire id_14,
    input tri id_15,
    output supply1 id_16,
    input tri id_17,
    output supply1 id_18
);
  assign id_8 = -1;
  reg
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37,
      id_38,
      id_39;
  always @(posedge id_29 or posedge 1 + id_31) begin : LABEL_0
    id_30 <= 1;
  end
endmodule
module module_1 #(
    parameter id_41 = 32'd65
) (
    input wire id_0,
    input wor id_1,
    input wor id_2,
    output supply1 id_3,
    output wor id_4,
    output uwire id_5,
    input tri id_6,
    output wor id_7,
    input wor id_8,
    input tri1 id_9,
    input tri1 id_10,
    output uwire id_11,
    output tri1 id_12,
    output wand id_13,
    output wor id_14,
    input tri0 id_15,
    output wor id_16,
    output uwire id_17,
    inout tri0 id_18,
    input wor id_19,
    input wand id_20,
    input wand id_21
    , id_47,
    output supply0 id_22,
    input tri1 id_23,
    input wor id_24,
    input supply0 id_25,
    output supply1 id_26,
    input wire id_27,
    input supply1 id_28,
    input supply0 id_29,
    output tri1 id_30,
    output uwire id_31,
    output wire id_32,
    input wand id_33,
    output supply1 id_34,
    input wand id_35,
    input tri id_36,
    input supply1 id_37,
    output tri id_38,
    input tri id_39,
    output supply1 id_40,
    input supply0 _id_41,
    input wire id_42,
    input uwire id_43,
    input wand id_44,
    output wire id_45
);
  parameter [id_41 : 1] id_48 = -1;
  wire id_49;
  module_0 modCall_1 (
      id_44,
      id_44,
      id_35,
      id_20,
      id_21,
      id_17,
      id_7,
      id_40,
      id_31,
      id_33,
      id_28,
      id_22,
      id_34,
      id_45,
      id_29,
      id_36,
      id_5,
      id_15,
      id_17
  );
  assign modCall_1.id_23 = 0;
  assign id_45 = !id_10 ? 1 ~^ id_6 : 1 == -1;
  always @(*) begin : LABEL_0
    $signed(90);
    ;
  end
endmodule
