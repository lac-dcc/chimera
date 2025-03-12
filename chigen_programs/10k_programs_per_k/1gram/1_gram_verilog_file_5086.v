// Seed: 272221122
module module_0 (
    output logic id_0,
    input  uwire id_1,
    input  tri0  id_2
);
  always_ff id_0 = 1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign module_1.id_0  = 0;
endmodule
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    output tri   id_2,
    input  wor   id_3,
    output logic id_4,
    input  tri0  id_5
);
  wire id_7;
  logic id_8, id_9;
  always id_4 = 1'd0;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1
  );
endmodule
module module_2 ();
  id_1 :
  assert property (@(posedge -1) 1 & id_1) $signed(87);
  ;
  wire id_2, id_3;
  assign id_2 = id_1;
endmodule
