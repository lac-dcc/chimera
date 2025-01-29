// Seed: 697962672
module module_0 (
    output tri0  id_0,
    input  wor   id_1,
    input  uwire id_2
);
  assign id_0 = 1;
  always id_0 = id_2;
  assign module_1.id_1 = 0;
  id_4 :
  assert property (@(posedge id_2) id_4) $display(-1, 1, 1 && 1, "", -1'h0 | id_4);
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    output wand  id_2,
    output uwire id_3
);
  assign id_2 = id_1;
  assign id_0 = 1;
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
endmodule
