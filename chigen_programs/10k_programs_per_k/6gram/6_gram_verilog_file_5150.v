// Seed: 4014938278
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    input supply0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wand id_5,
    output tri id_6,
    input supply0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input tri1 id_10,
    input uwire id_11,
    output wor id_12,
    input tri0 id_13
    , id_23,
    input uwire id_14,
    input wand id_15,
    input tri1 id_16,
    input tri1 id_17,
    input supply1 id_18,
    output tri id_19,
    output tri id_20,
    output wor id_21
);
  assign id_23 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd39,
    parameter id_9 = 32'd64
) (
    output tri1 id_0,
    input tri1 id_1,
    input wor id_2,
    output tri1 id_3,
    input supply0 id_4,
    output uwire id_5,
    input supply1 id_6,
    input tri0 id_7,
    output supply1 _id_8,
    input wire _id_9,
    input supply1 id_10,
    input wire id_11,
    input wor id_12,
    output tri1 id_13,
    output tri0 id_14,
    input supply1 id_15,
    input uwire id_16,
    input supply0 id_17,
    input tri id_18,
    input wor id_19,
    input wire id_20,
    output supply0 id_21,
    input tri0 id_22,
    input tri1 id_23,
    output tri0 id_24,
    input uwire id_25,
    output uwire id_26,
    output supply0 id_27,
    input supply0 id_28,
    output wor id_29,
    input tri1 id_30,
    input wand id_31,
    output tri1 id_32,
    input tri1 id_33,
    output supply0 id_34
);
  wire [-1 : -1  +  id_9] id_36;
  assign id_14 = id_28 ? id_19 : -1 ? id_10 : 1;
  logic [-1 : ~  id_8] id_37;
  ;
  always @(negedge id_36) begin : LABEL_0
    $signed(97);
    ;
  end
  nor primCall (
      id_34,
      id_18,
      id_31,
      id_1,
      id_2,
      id_36,
      id_28,
      id_19,
      id_33,
      id_37,
      id_16,
      id_30,
      id_25,
      id_17,
      id_20,
      id_4,
      id_6,
      id_11,
      id_23,
      id_7,
      id_10,
      id_12,
      id_15,
      id_22
  );
  module_0 modCall_1 (
      id_14,
      id_27,
      id_2,
      id_22,
      id_18,
      id_10,
      id_29,
      id_15,
      id_18,
      id_7,
      id_19,
      id_2,
      id_24,
      id_20,
      id_4,
      id_15,
      id_33,
      id_28,
      id_22,
      id_26,
      id_3,
      id_34
  );
  assign modCall_1.id_4 = 0;
  assign id_27 = id_10;
endmodule
