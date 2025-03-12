// Seed: 1244514151
module module_0 (
    output wire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output tri1 id_5,
    input tri1 id_6,
    input wand id_7,
    input tri id_8,
    output wand id_9
    , id_11
);
  id_12 :
  assert property (@(posedge 1 - id_7 == 1'b0) -1 * 1)
  else $unsigned(42);
  ;
  wire id_13;
endmodule
module module_1 #(
    parameter id_1 = 32'd18
) (
    input tri0 id_0,
    input uwire _id_1,
    input uwire id_2,
    input supply1 id_3,
    input wand id_4,
    output uwire id_5,
    output wand id_6,
    input wand id_7,
    output wand id_8
);
  logic [-1 : id_1] id_10;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_4,
      id_0,
      id_3,
      id_5,
      id_7,
      id_0,
      id_3,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
