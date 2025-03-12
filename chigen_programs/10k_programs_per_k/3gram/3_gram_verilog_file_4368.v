// Seed: 3936540198
module module_0;
  logic id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  inout reg id_7;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  output reg id_6;
  inout wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  nand primCall (id_3, id_4, id_5, id_7, id_9);
  input wire id_2;
  input wire id_1;
  always_latch @(posedge -1 && -1)
    if (1) @(posedge id_2) id_6 = id_7;
    else for (id_7 = id_4; id_2; id_3[-1 :-1'b0] = 1 == -1) id_7 <= !1;
endmodule
