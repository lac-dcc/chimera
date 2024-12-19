// Seed: 1495650279
module module_0;
  wire id_1;
  assign module_2.type_2 = 0;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    input  tri   id_2,
    output tri1  id_3
);
  tri1 id_5;
  module_0 modCall_1 ();
  assign id_5 = id_2;
endmodule
module module_2 (
    output logic id_0,
    input  logic id_1,
    output tri1  id_2
);
  module_0 modCall_1 ();
  always_comb @(posedge id_1 or negedge 1'b0) id_0 = #1 id_1;
  wire id_4;
endmodule
module module_3 (
    output wor  id_0,
    input  wire id_1
);
  uwire id_3;
  nand primCall (id_0, id_1, id_3);
  module_0 modCall_1 ();
  wire id_4;
  wire id_5;
  id_6(
      1 >= id_1 | 1, {1, id_3 & id_0}
  );
endmodule
