// Seed: 547108602
module module_0 ();
  wire id_2;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  xor primCall (id_1, id_5, id_6, id_7);
  module_0 modCall_1 ();
endmodule
module module_2 ();
  assign id_1 = 1;
  assign id_1 = id_1;
endmodule
module module_3 (
    output wire  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    input  tri   id_3,
    input  wand  id_4,
    output logic id_5,
    output logic id_6,
    input  wand  id_7,
    input  tri   id_8,
    output logic id_9
);
  initial id_5 = 1;
  always_comb @(posedge 1'b0 or negedge 1) begin : LABEL_0
    id_6 <= #1'b0;
    $display;
    id_5 <= 1;
    id_9 <= 1;
  end
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
