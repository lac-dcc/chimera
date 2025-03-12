// Seed: 2766271106
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wand id_4,
    output tri1 id_5,
    output supply0 id_6,
    input wire id_7
);
  assign id_6 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd70,
    parameter id_3  = 32'd34
) (
    input wor id_0,
    output tri0 id_1,
    input tri0 id_2,
    input supply1 _id_3,
    input wire id_4,
    input wand id_5,
    input tri0 id_6,
    input uwire id_7,
    input tri id_8,
    input wor id_9,
    output supply1 id_10,
    input tri id_11,
    input supply1 _id_12,
    input supply0 id_13,
    input wand id_14,
    input tri1 id_15,
    input uwire id_16,
    output tri id_17
);
  logic [id_12 : id_3] id_19;
  always @(id_12) begin : LABEL_0
    $unsigned(70);
    ;
  end
  initial assume (-1 == id_15);
  assign id_17 = id_2;
  module_0 modCall_1 (
      id_6,
      id_17,
      id_2,
      id_5,
      id_1,
      id_17,
      id_10,
      id_13
  );
  nand primCall (
      id_1, id_11, id_4, id_9, id_19, id_2, id_15, id_0, id_5, id_6, id_7, id_14, id_16, id_8
  );
endmodule
