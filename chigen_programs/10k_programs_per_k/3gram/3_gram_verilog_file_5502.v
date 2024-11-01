// Seed: 3549070558
module module_0 ();
  assign id_1 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  assign id_4[1] = 1;
  module_0();
  xor (id_1, id_3, id_4, id_5, id_7, id_8);
endmodule
macromodule module_2 (
    input logic id_0,
    input wand  id_1
);
  id_3 :
  assert property (@(posedge id_0) 1)
  else id_3 <= 1;
  module_0();
  assign id_3 = 1;
  wire id_4 = id_4, id_5;
endmodule
