// Seed: 3064411345
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5,
    output tri id_6,
    output uwire id_7,
    output tri0 id_8,
    output tri1 id_9,
    input wor id_10,
    output tri0 module_0
);
  parameter id_13 = 1;
  always_latch force id_11 = (~id_13 == -1) && id_1 == 1'd0;
endmodule
module module_1 #(
    parameter id_5 = 32'd37,
    parameter id_7 = 32'd53
) (
    input wand id_0,
    input wor id_1,
    output wor id_2,
    output tri1 id_3,
    input wire id_4,
    input uwire _id_5,
    input wire id_6,
    input supply1 _id_7,
    input wor id_8
);
  assign id_3 = id_7;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_8,
      id_0,
      id_6,
      id_0,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_9 = 0;
  wire [id_7 : ~  (  id_5  )  -  id_5] id_10;
endmodule
