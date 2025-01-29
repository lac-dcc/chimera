// Seed: 995793814
macromodule module_0;
  always $display();
  wire id_2, id_3 = id_3;
  assign module_2.id_2 = 0;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input logic id_0
);
  assign id_2.id_0 = id_0;
  bit id_3 = 1;
  final @(*) id_2 <= id_3;
  module_0 modCall_1 ();
endmodule
module module_2;
  wire id_1;
  module_0 modCall_1 ();
  wire id_4;
endmodule
module module_3 (
    input tri0  id_0,
    input logic id_1,
    input logic id_2
);
  always_latch @(posedge id_1 == id_2) @(posedge 1) id_4 <= {id_2{id_1}};
  module_0 modCall_1 ();
endmodule
