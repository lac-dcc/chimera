// Seed: 394157096
module module_0 (
    output supply1 id_0,
    output uwire id_1,
    input tri id_2,
    output uwire id_3,
    input wand id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wand id_7,
    output supply1 id_8
);
  assign id_3 = id_7 ? id_4 : -1 ? id_5 : 1;
endmodule
module module_1 #(
    parameter id_0 = 32'd72,
    parameter id_4 = 32'd36
) (
    input uwire _id_0,
    output uwire id_1,
    output supply0 id_2,
    input tri id_3,
    input uwire _id_4,
    output tri id_5
    , id_12,
    input supply1 id_6,
    output wor id_7,
    output wor id_8,
    input uwire id_9,
    input uwire id_10
);
  wire id_13;
  wire [id_4 : id_0] id_14;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_9,
      id_5,
      id_6,
      id_3,
      id_3,
      id_9,
      id_5
  );
  assign modCall_1.id_4 = 0;
  wire id_15;
endmodule
