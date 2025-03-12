// Seed: 2484985342
module module_0 (
    output uwire id_0,
    input  wor   id_1,
    input  tri0  id_2,
    output wire  id_3
);
endmodule
module module_1 (
    output wand  id_0,
    output tri0  id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  wire  id_4,
    output logic id_5,
    input  uwire id_6,
    input  wire  id_7,
    input  wor   id_8,
    output uwire id_9,
    output tri   id_10,
    input  wire  id_11
);
  parameter id_13 = 1;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_8,
      id_1
  );
  assign modCall_1.id_1 = 0;
  integer [!  1 : 1] id_14;
  ;
  always_comb @(posedge id_6 or posedge 1)
    if (1) id_14 = id_8 > -1;
    else id_5 = -1;
endmodule
