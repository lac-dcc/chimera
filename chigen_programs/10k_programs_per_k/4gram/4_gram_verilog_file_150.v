// Seed: 2156753979
module module_0 (
    input  wor  id_0,
    output tri0 id_1,
    input  wire id_2
);
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input  wor  id_1,
    input  tri  id_2,
    output tri  id_3
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_0 #(
    parameter id_6 = 32'd43
) (
    output supply1 id_0,
    input wire id_1,
    output tri0 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wand id_5,
    input wor _id_6,
    output tri1 id_7,
    input supply1 id_8,
    output tri1 id_9,
    output tri id_10
    , id_27,
    input tri0 module_2,
    output supply0 id_12,
    output supply1 id_13,
    output supply0 id_14,
    output supply1 id_15,
    output tri1 id_16,
    output tri id_17,
    input tri0 id_18,
    output supply1 id_19,
    output tri1 id_20,
    input wor id_21,
    input uwire id_22,
    input wor id_23,
    output wor id_24,
    output supply1 id_25
);
  wire [1 : -1] id_28;
  wire [-1 : id_6] id_29;
  xor primCall (id_10, id_5, id_1, id_18, id_3, id_29, id_21, id_23, id_28, id_8, id_22);
  module_0 modCall_1 (
      id_21,
      id_12,
      id_5
  );
  assign id_27 = id_28;
endmodule
