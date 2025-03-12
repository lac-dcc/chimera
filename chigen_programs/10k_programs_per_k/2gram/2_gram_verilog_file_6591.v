// Seed: 1148368609
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output tri0 id_2,
    output uwire id_3,
    input wand id_4,
    input supply0 id_5,
    input tri id_6,
    output wor id_7,
    input supply0 id_8
);
  assign id_3 = 1'd0;
endmodule
module module_1 #(
    parameter id_6 = 32'd96
) (
    input  wand id_0,
    output wire id_1,
    inout  wor  id_2,
    inout  tri0 id_3
);
  assign id_3 = -1;
  wire id_5;
  assign id_5 = id_2;
  parameter id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_7 = 0;
  wire id_7;
  id_8 :
  assert property (@(posedge 1) -1)
  else;
  assign id_8 = id_5;
  wand [id_6 : ""] id_9;
  assign id_9 = 1'b0;
endmodule
