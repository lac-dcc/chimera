// Seed: 2103634617
module module_0 (
    input wire id_0,
    input uwire id_1,
    input tri0 id_2,
    input wor id_3,
    output supply1 id_4,
    input wand id_5,
    output wire id_6
);
  assign id_6 = id_3;
endmodule
module module_1 #(
    parameter id_6 = 32'd40
) (
    input  wand id_0,
    input  tri  id_1,
    input  wor  id_2,
    output tri1 id_3,
    inout  wire id_4,
    input  wire id_5,
    output tri0 _id_6,
    output tri0 id_7
);
  logic [id_6 : -1] id_9, id_10;
  nor primCall (id_4, id_0, id_2, id_10, id_9, id_1);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_0,
      id_4,
      id_2,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
