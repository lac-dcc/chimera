// Seed: 1113828982
module module_0 (
    output tri1 id_0,
    input tri id_1,
    input wand id_2,
    input wire id_3,
    input wand id_4,
    output tri id_5,
    input uwire id_6,
    input supply0 id_7,
    input uwire id_8,
    output tri0 id_9,
    output supply1 id_10,
    output supply0 id_11,
    input tri id_12,
    input uwire id_13,
    output supply0 id_14,
    input supply1 id_15,
    input tri id_16,
    input uwire id_17,
    input supply0 id_18,
    input supply1 id_19,
    output wor id_20
);
  initial begin : LABEL_0
    $unsigned(50);
    ;
  end
endmodule
module module_1 #(
    parameter id_5 = 32'd12
) (
    output supply1 id_0,
    input uwire id_1,
    input tri1 id_2,
    output tri1 id_3,
    input tri id_4,
    input supply0 _id_5
);
  logic [1 : id_5] id_7 = -1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_1,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1,
      id_3,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
