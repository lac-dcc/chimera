// Seed: 3224047941
module module_0 (
    output wor   id_0,
    input  wor   id_1,
    output wand  id_2,
    output tri1  id_3,
    input  wire  id_4,
    input  uwire id_5,
    input  wand  id_6,
    output wire  id_7,
    input  wire  id_8
);
  always begin : LABEL_0
    $unsigned(87);
    ;
  end
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output wire  id_3,
    input  uwire id_4,
    input  tri0  id_5
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_2,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
