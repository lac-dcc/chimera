// Seed: 3196557454
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input wor id_2,
    input wand id_3,
    output wand id_4,
    output tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri id_8
);
  for (id_10 = id_2 == 1; id_1; id_10 = -1) begin : LABEL_0
    assign id_5 = id_8;
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd39,
    parameter id_13 = 32'd63,
    parameter id_2  = 32'd35,
    parameter id_20 = 32'd4
) (
    input wand id_0,
    output supply0 id_1,
    input supply1 _id_2,
    input tri1 id_3,
    input tri0 id_4,
    output supply0 id_5,
    output uwire id_6,
    input tri0 id_7,
    input wire id_8,
    output tri1 id_9,
    input uwire _id_10,
    output supply0 id_11,
    input uwire id_12,
    input supply1 _id_13,
    output wand id_14,
    output wire id_15,
    input supply0 id_16,
    output uwire id_17,
    output uwire id_18
);
  assign id_17 = 1'b0;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_16,
      id_3,
      id_1,
      id_1,
      id_12,
      id_4,
      id_16
  );
  assign modCall_1.id_0 = 0;
  wire [id_10 : id_13] _id_20;
  wire [ id_2 : id_20] id_21;
endmodule
