// Seed: 3028757448
module module_0 (
    output supply0 id_0,
    output supply0 id_1
    , id_6,
    output uwire id_2,
    input tri0 id_3,
    input supply0 id_4
);
  assign id_0 = id_4;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd58
) (
    output wor  id_0,
    input  tri0 id_1,
    output wand id_2,
    output tri0 id_3,
    input  tri1 id_4,
    input  tri  _id_5,
    input  wor  id_6
);
  wand id_8 = id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_1,
      id_6
  );
  assign id_2 = -1'b0;
  logic [id_5 : -1 'd0] id_9 = 1;
  assign id_8 = 1 * -1 + ~id_9;
endmodule
