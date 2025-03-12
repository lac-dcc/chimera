// Seed: 3037654613
module module_0 (
    input supply1 id_0
);
  assign module_2.id_0 = 0;
endmodule
program module_1 #(
    parameter id_12 = 32'd60
) (
    input tri0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input uwire id_3,
    output supply0 id_4,
    output wire id_5,
    input supply1 id_6,
    input tri1 id_7,
    output uwire id_8,
    output tri id_9,
    input tri1 id_10,
    output wire id_11,
    input supply1 _id_12
);
  wire [id_12 : 1] id_14;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
endprogram
module module_2 #(
    parameter id_1 = 32'd81
) (
    output supply0 id_0,
    input tri0 _id_1,
    input supply0 id_2
);
  wire [1 : id_1] id_4;
  module_0 modCall_1 (id_2);
  assign id_0 = id_4;
  assign id_0 = id_2 & id_4;
  assign id_4 = id_2;
  logic [-1 : id_1] id_5;
endmodule
