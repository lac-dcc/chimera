// Seed: 2426385224
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input supply0 id_2,
    input tri id_3,
    output wand id_4,
    input uwire id_5,
    output tri id_6,
    output tri1 id_7
);
  assign id_7 = 'b0;
  assign id_7 = -1'd0;
  logic id_9;
  ;
endmodule
module module_1 #(
    parameter id_16 = 32'd28
) (
    input uwire id_0,
    output tri0 id_1
    , id_11,
    input wire id_2,
    input wor id_3,
    output uwire id_4,
    output wand id_5,
    output supply1 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input wand id_9
);
  tri0  id_12  ,  id_13  ,  id_14  ,  id_15  ,  _id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ;
  assign id_22 = id_3 ? !id_9 & id_24 : id_22;
  wire [1 : id_16] id_31;
  assign id_29 = 1'h0;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_2,
      id_7,
      id_5,
      id_7,
      id_6,
      id_4
  );
  assign modCall_1.id_5 = 0;
  logic id_32;
  wire  id_33;
  wire  id_34;
  ;
  assign id_15 = {1, ({id_9, id_32}), -1};
  nor primCall (
      id_4,
      id_8,
      id_13,
      id_23,
      id_21,
      id_24,
      id_0,
      id_28,
      id_26,
      id_31,
      id_7,
      id_12,
      id_18,
      id_3,
      id_15,
      id_11,
      id_19,
      id_9,
      id_22,
      id_29,
      id_30,
      id_17,
      id_25,
      id_27,
      id_2,
      id_14
  );
  integer id_35;
endmodule
