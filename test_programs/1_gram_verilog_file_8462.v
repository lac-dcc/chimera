// Seed: 2137186665
module module_0;
  wire id_1, id_2;
  final $display;
  wire id_3;
  assign module_2.type_0 = 0;
endmodule
module module_1 (
    input wand id_0
);
  module_0 modCall_1 ();
  assign id_2 = 1;
  wire id_3, id_4;
  wire id_5, id_6;
endmodule
module module_2 (
    output logic id_0,
    input  logic id_1
);
  logic id_3;
  always #1 if (id_1) id_0 <= 1;
  assign id_0 = id_1;
  assign id_0 = id_3;
  if (1'b0 ? 1 : -1) assign id_0 = id_3;
  else assign id_0 = id_1 | -1;
  tri id_4;
  logic id_5, id_6, id_7;
  assign id_4 = id_4 - id_5;
  module_0 modCall_1 ();
  id_8 :
  assert property (@(1 or id_3) -1) id_5 = id_1;
endmodule
