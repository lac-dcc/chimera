// Seed: 3278517833
module module_0;
  wire id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd23
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  inout wire id_3;
  inout wire _id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  wire [-1 : 1] id_5;
  assign id_3 = id_4[1][id_2];
  wire id_6, id_7;
  assign id_5 = id_3;
endmodule
module module_2 #(
    parameter id_4 = 32'd13
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  module_0 modCall_1 ();
  inout logic [7:0] id_3;
  inout wire id_2;
  output wor id_1;
  wire [-1 : -1] id_5;
  assign id_3[1'b0] = id_3;
  parameter id_6 = -1'b0;
  wire [id_4 : 1] id_7;
  logic id_8;
  logic id_9;
  ;
  assign id_1 = id_3 && $realtime;
  assign id_7 = id_6;
endmodule
