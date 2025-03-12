// Seed: 1084594819
module module_0 (
    input  wire  id_0,
    input  wand  id_1,
    input  tri1  id_2,
    output uwire id_3,
    input  tri0  id_4,
    input  uwire id_5
);
  assign id_3 = id_2;
  wire id_7;
  always begin : LABEL_0
    $signed(25);
    ;
  end
  wire id_8;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd50
) (
    input  wor   _id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  tri1  id_3
    , id_8,
    input  tri0  id_4,
    output wire  id_5,
    input  tri   id_6
);
  assign id_5 = id_8[id_0];
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_5,
      id_6,
      id_1
  );
endmodule
