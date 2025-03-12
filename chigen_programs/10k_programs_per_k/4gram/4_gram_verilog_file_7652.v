// Seed: 2907202563
module module_0;
  wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd77
) (
    _id_1,
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
  inout wire _id_1;
  wire id_7, id_8, id_9;
  wire [1 : id_1] id_10;
  module_0 modCall_1 ();
  parameter id_11 = 1;
endmodule
module module_2 #(
    parameter id_2 = 32'd18
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  buf primCall (id_3, id_4);
  inout logic [7:0] id_3;
  inout wire _id_2;
  input wire id_1;
  assign id_3[id_2] = id_4[1];
  module_0 modCall_1 ();
  wand [1 'b0 : 1 'b0] id_5 = -1;
  assign id_5 = id_4;
  tri [id_2 : -1 'h0] id_6 = -1;
  supply0 id_7;
  assign id_7 = id_5 ? -1'b0 : id_3;
endmodule
