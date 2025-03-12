// Seed: 1690688781
program module_0 #(
    parameter id_5 = 32'd57
) (
    input wand id_0,
    output tri void id_1
    , _id_5,
    input tri id_2,
    output supply0 id_3
);
  uwire id_6 = -1'b0, id_7 = 1;
  wire [id_5 : 1] id_8 = id_2;
endprogram
module module_1 #(
    parameter id_10 = 32'd63
) (
    input wor id_0,
    output wor id_1,
    output uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5[1 : id_10],
    input tri id_6,
    output uwire id_7,
    output uwire id_8[-1 : -1],
    input tri id_9,
    output wand _id_10,
    input wire id_11,
    input wor id_12,
    input supply0 id_13,
    output uwire id_14
    , id_16
);
  assign id_7 = 1'h0;
  nor primCall (id_14, id_6, id_12, id_3, id_16, id_0, id_13, id_9, id_11);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_14
  );
  assign modCall_1.id_2 = 0;
  assign id_8 = id_3;
endmodule
