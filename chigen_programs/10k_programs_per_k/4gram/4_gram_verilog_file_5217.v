// Seed: 925946754
module module_0 (
    input tri id_0,
    output uwire id_1
    , id_11,
    input uwire id_2,
    input wand id_3,
    input wand id_4,
    output tri id_5,
    input wor id_6,
    input wand id_7,
    input supply1 id_8,
    output tri id_9
    , id_12
);
  assign id_5 = 1 - 1;
  wire id_13;
  assign module_2.id_4 = 0;
  assign module_1.id_1 = 0;
  wire id_14;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output wand  id_2
);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2 #(
    parameter id_5 = 32'd33
) (
    input  wor   id_0,
    output tri0  id_1,
    input  uwire id_2,
    output wand  id_3,
    input  tri1  id_4,
    input  tri1  _id_5,
    output uwire id_6
);
  wire [id_5 : 1] id_8;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_4,
      id_2,
      id_2,
      id_3,
      id_4,
      id_0,
      id_2,
      id_6
  );
  id_9 :
  assert property (@(posedge id_0) -1)
  else $signed(35);
  ;
endmodule
