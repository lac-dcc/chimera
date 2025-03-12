// Seed: 1505825887
module module_0 (
    output wor id_0,
    input wand id_1,
    input supply0 id_2,
    input wire id_3,
    output wire id_4,
    output tri0 id_5
);
  wire id_7;
  wire id_8;
  assign id_4 = id_7;
  wire id_9;
endmodule
module module_1 #(
    parameter id_13 = 32'd27
) (
    output tri id_0,
    input uwire id_1,
    input wand id_2,
    input wire id_3,
    input wor id_4,
    input supply0 id_5,
    output supply1 id_6,
    input wand id_7,
    input uwire id_8,
    output wor id_9,
    output wor id_10,
    input uwire id_11,
    output uwire id_12,
    input uwire _id_13,
    input supply0 id_14,
    input tri id_15,
    input tri id_16,
    input supply1 id_17,
    input supply1 id_18
);
  wire [id_13 : 1] id_20;
  xnor primCall (
      id_6, id_8, id_20, id_7, id_11, id_1, id_15, id_4, id_5, id_17, id_16, id_18, id_14, id_2
  );
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_5,
      id_0,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
