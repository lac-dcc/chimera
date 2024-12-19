// Seed: 1808206883
module module_0 (
    output wand id_0
);
  wire id_2;
  assign module_1.type_0 = 0;
  wire id_3, id_4;
endmodule
module module_1 (
    output logic   id_0,
    output supply0 id_1
);
  always_latch id_0 <= id_3;
  module_0 modCall_1 (id_1);
endmodule
module module_2;
  assign id_1 = 1;
endmodule
module module_3 (
    input logic id_0,
    input logic id_1
);
  reg id_3;
  always id_3 <= id_1;
  logic id_4;
  tri1  id_5;
  assign id_3 = 1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_5 = 1;
  initial id_3.id_1 <= 1;
  id_6 :
  assert property (@(posedge 1 or posedge id_1 or posedge 1'b0) id_4)
    if (id_0) #1 id_4 = id_0;
    else id_4 = 1;
endmodule
