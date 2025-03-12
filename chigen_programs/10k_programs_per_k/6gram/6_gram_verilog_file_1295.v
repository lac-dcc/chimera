// Seed: 251682140
module module_0 (
    input  tri1 id_0,
    input  wand id_1,
    input  tri  id_2,
    input  wand id_3,
    output wand id_4
);
  wire id_6;
  assign id_4 = id_6;
  assign module_1.id_4 = 0;
  reg id_7;
  always @(posedge 1 or negedge 1) id_7 <= #1 -1 == -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd50,
    parameter id_5 = 32'd48
) (
    output uwire _id_0,
    input  wand  id_1,
    output uwire id_2,
    input  wire  id_3,
    input  wand  id_4
    , id_7,
    input  tri   _id_5
);
  logic [id_0 : id_5] id_8;
  ;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_4,
      id_2
  );
  assign id_8 = (id_7);
  xor primCall (id_2, id_8, id_7, id_4);
endmodule
