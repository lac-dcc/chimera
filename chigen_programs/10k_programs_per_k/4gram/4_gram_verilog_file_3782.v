// Seed: 2090307117
module module_0 (
    output wire id_0,
    output wor  id_1
);
endmodule
module module_1 #(
    parameter id_13 = 32'd90
) (
    input  tri0 id_0,
    input  tri  id_1,
    input  tri1 id_2,
    input  wor  id_3,
    output tri  id_4,
    input  tri0 id_5,
    input  wand id_6,
    input  tri  id_7,
    output tri0 id_8,
    input  tri  id_9
);
  logic id_11;
  wire  id_12 = id_5;
  assign id_12 = 1 ? id_5 : id_5;
  nor primCall (id_4, id_2, id_1);
  logic _id_13;
  ;
  wor id_14 = id_2;
  assign id_4  = id_5;
  assign id_14 = -1;
  module_0 modCall_1 (
      id_8,
      id_4
  );
  assign modCall_1.id_0 = 0;
  wire [id_13 : -1] id_15 = (id_7);
endmodule
