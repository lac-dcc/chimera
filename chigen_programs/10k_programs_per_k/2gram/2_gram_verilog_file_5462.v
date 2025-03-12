// Seed: 3955217726
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input tri id_3,
    output wor id_4,
    input wire id_5,
    output tri0 id_6,
    output wor id_7,
    output wand id_8,
    output tri id_9,
    input uwire id_10,
    input wor id_11,
    input tri id_12,
    input wire id_13,
    input wire id_14,
    input supply0 id_15,
    input tri id_16,
    input supply1 id_17,
    output tri id_18,
    output tri1 id_19,
    output tri id_20,
    input tri0 id_21,
    input wand id_22,
    output wor id_23,
    input wor id_24,
    input wor id_25,
    input supply1 id_26,
    input supply1 id_27,
    input wor id_28,
    input tri id_29,
    input uwire id_30,
    input supply0 id_31,
    output tri1 id_32,
    input tri0 id_33,
    input tri1 id_34
);
  wire id_36;
  ;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    output tri0  id_2,
    output tri1  id_3,
    input  wor   id_4
);
  logic [7:0] id_6;
  assign id_3 = id_6[-1'd0];
  assign id_3 = id_1 || id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4,
      id_4,
      id_0,
      id_1,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_18 = 0;
endmodule
