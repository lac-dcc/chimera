// Seed: 2510266415
module module_0 ();
  bit id_1;
  always @(negedge -1, posedge (1) or negedge id_1) id_1 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd88,
    parameter id_4 = 32'd97,
    parameter id_5 = 32'd49
) (
    _id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire _id_1;
  logic [-1 : id_1] _id_4;
  wire _id_5;
  wire id_6[id_5  >  id_4 : id_1];
  module_0 modCall_1 ();
  assign id_6 = (id_5);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output logic [7:0] id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  module_0 modCall_1 ();
  wire id_4;
  assign id_3[1] = -1'h0;
  assign id_1 = id_4;
  assign id_4 = id_2#(.id_4(1));
endmodule
