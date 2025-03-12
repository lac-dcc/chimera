// Seed: 1956539645
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output wor id_2,
    input wor id_3,
    input wand id_4,
    input wand id_5,
    output supply1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    input tri id_9,
    input tri1 id_10,
    output supply1 id_11,
    output uwire id_12,
    input wor id_13,
    input wire id_14,
    input supply1 id_15,
    input tri1 id_16,
    output uwire id_17,
    input supply1 id_18,
    input tri1 id_19,
    output uwire id_20,
    input supply0 id_21,
    output wor id_22,
    output supply1 id_23,
    output supply0 id_24
);
  wire id_26;
  assign id_20 = -1;
  logic [1 'b0 : 1] id_27;
  ;
  logic id_28;
endmodule
module module_0 #(
    parameter id_0 = 32'd74
) (
    input tri1 _id_0,
    output tri1 id_1,
    input wire id_2,
    output tri0 id_3,
    output tri id_4,
    input tri id_5,
    output wand id_6,
    input wor module_1,
    input supply0 id_8,
    input tri id_9,
    input tri0 id_10,
    input uwire id_11,
    output wire id_12,
    output wand id_13,
    input wand id_14,
    input uwire id_15,
    input supply0 id_16,
    input wand id_17,
    input tri0 id_18,
    input wand id_19
);
  pullup (1'h0, id_7, 1 & -1, id_2 ~^ id_14, 1);
  logic [1 : -1  *  id_0] id_21;
  ;
  assign id_4 = id_10;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_13,
      id_9,
      id_10,
      id_5,
      id_3,
      id_9,
      id_4,
      id_2,
      id_15,
      id_6,
      id_4,
      id_5,
      id_5,
      id_11,
      id_17,
      id_6,
      id_11,
      id_8,
      id_4,
      id_17,
      id_4,
      id_13,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
