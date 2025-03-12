// Seed: 13402202
module module_0 ();
  localparam id_1 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd54
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output reg id_4;
  output logic [7:0] id_3;
  input wire id_2;
  input logic [7:0] id_1;
  assign id_3[-1 : 1] = id_1;
  tri id_7 = -1;
  _id_8 :
  assert property (@(id_7) id_1)
  else id_4 = id_7;
  module_0 modCall_1 ();
  assign id_4 = id_1[!id_8] - -1'b0;
endmodule
