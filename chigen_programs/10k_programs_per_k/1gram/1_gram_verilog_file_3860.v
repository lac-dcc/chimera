// Seed: 3841459462
module module_0 (
    input uwire id_0
);
endmodule
module module_1 #(
    parameter id_2 = 32'd46
) (
    input  tri   id_0,
    output wire  id_1,
    input  uwire _id_2
);
  wire [-1 'h0 : id_2] id_4, id_5;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_2 = 32'd17
) (
    input supply1 id_0,
    output wand id_1,
    input supply0 _id_2
);
  wire id_4[id_2 : -1];
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
endmodule
module module_3 #(
    parameter id_2 = 32'd26,
    parameter id_3 = 32'd54,
    parameter id_7 = 32'd39,
    parameter id_8 = 32'd78
) (
    input tri id_0,
    input wand id_1,
    input supply1 _id_2,
    input wire _id_3,
    output wor id_4,
    output wor id_5,
    output tri1 id_6,
    input wor _id_7,
    input tri0 _id_8,
    input supply1 id_9
);
  wire [id_8 : id_7] \id_11 [id_3 : id_2];
  module_0 modCall_1 (id_9);
  assign modCall_1.id_0 = 0;
  assign id_5 = id_1;
  or primCall (id_4, \id_11 , id_9, id_0, id_1);
endmodule
