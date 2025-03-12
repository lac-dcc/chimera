// Seed: 91130525
module module_0 (
    output tri id_0,
    input tri0 id_1,
    output uwire id_2,
    input wor id_3,
    input tri0 id_4,
    output tri id_5,
    input tri0 id_6,
    input wand id_7,
    output wire id_8,
    output tri1 id_9,
    output uwire id_10,
    input supply1 id_11,
    output supply0 id_12
);
  logic id_14 = id_7;
  assign id_12 = 1'b0;
endmodule
module module_1 #(
    parameter id_8 = 32'd87
) (
    input uwire id_0,
    output supply1 id_1,
    output wand id_2,
    output tri1 id_3,
    output tri1 id_4,
    input supply0 id_5,
    input uwire id_6,
    output wand id_7,
    input uwire _id_8
);
  logic [id_8 : 1] id_10;
  ;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_5,
      id_0,
      id_4,
      id_5,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule
