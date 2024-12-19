// Seed: 1065707927
module module_0 (
    output tri0 id_0
);
  assign id_0 = id_2;
endmodule
macromodule module_1 (
    input  wire  id_0,
    output tri1  id_1,
    input  tri1  id_2,
    input  wor   id_3,
    output wire  id_4,
    output wand  id_5,
    input  uwire id_6,
    input  wire  id_7,
    input  uwire id_8
);
  module_0 modCall_1 (id_4);
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    input wand id_0,
    output tri0 id_1,
    input uwire id_2,
    output wor id_3,
    output uwire id_4,
    output wand id_5,
    input wire id_6,
    output supply1 id_7,
    output logic id_8,
    output supply1 id_9,
    output supply1 id_10,
    output tri id_11
);
  tri   id_13 = 1;
  uwire id_14;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
  reg id_15;
  id_16 :
  assert  property  (  @  (  posedge  id_0  or  id_13  or  posedge  id_2  or  posedge  id_14  |  id_13  or  posedge  1  or  1  )  id_0  -  id_6  )
    if (1) id_5 = id_16;
    else id_8 <= id_15;
endmodule
