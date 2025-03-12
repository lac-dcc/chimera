// Seed: 1975600598
module module_0;
  wire id_1;
  assign module_2.id_1 = 0;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output wand  id_0,
    output logic id_1,
    input  uwire id_2,
    input  wand  id_3,
    input  uwire id_4,
    input  tri   id_5
);
  wire id_7;
  module_0 modCall_1 ();
  always_ff id_1 <= -1;
endmodule
module module_2 #(
    parameter id_3 = 32'd60,
    parameter id_6 = 32'd52
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout logic [7:0] id_4;
  inout wire _id_3;
  inout wire id_2;
  inout uwire id_1;
  logic _id_6;
  assign id_4[id_6?id_3 : 1] = -1'b0;
  module_0 modCall_1 ();
  assign id_1 = id_1 !== 1;
endmodule
