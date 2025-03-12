// Seed: 2275441500
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wire id_2,
    input uwire id_3,
    output supply0 id_4,
    input wire id_5,
    input supply1 id_6,
    input wand id_7,
    output tri1 id_8,
    input uwire id_9,
    input wand id_10,
    output supply1 id_11,
    output tri0 id_12,
    output uwire id_13,
    input wire id_14,
    input wor id_15
);
  assign id_11 = {id_10{id_5 | -1}} + id_9;
  wire id_17;
endmodule
module module_1 #(
    parameter id_32 = 32'd92,
    parameter id_8  = 32'd16
) (
    input uwire id_0,
    output supply1 id_1,
    output tri1 id_2,
    input tri id_3,
    output supply0 id_4,
    input wor id_5,
    output tri id_6,
    output tri id_7,
    output supply1 _id_8,
    input tri id_9,
    input wire id_10,
    input wand id_11,
    output tri0 id_12,
    input uwire id_13,
    output uwire id_14,
    input supply1 id_15,
    output supply1 id_16,
    output wire id_17,
    output supply0 id_18,
    output tri1 id_19,
    output wand id_20,
    input uwire id_21,
    output wor id_22,
    output tri1 id_23,
    output wire id_24,
    output supply0 id_25,
    input wire id_26,
    input wire id_27,
    input tri id_28,
    output tri id_29,
    input uwire id_30,
    inout tri1 id_31,
    input tri _id_32,
    input tri id_33
);
  logic [1 : id_32  -  {  id_32  {  1 'h0 }  }] id_35;
  logic [id_8 : 1] id_36;
  ;
  module_0 modCall_1 (
      id_33,
      id_19,
      id_26,
      id_21,
      id_22,
      id_3,
      id_31,
      id_21,
      id_24,
      id_26,
      id_11,
      id_23,
      id_20,
      id_24,
      id_10,
      id_0
  );
  assign modCall_1.id_10 = 0;
endmodule
