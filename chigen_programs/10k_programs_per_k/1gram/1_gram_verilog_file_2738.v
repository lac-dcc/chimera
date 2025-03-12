// Seed: 433985217
module module_0 ();
  logic id_1;
  module_2 modCall_1 ();
endmodule
module module_1 #(
    parameter id_3 = 32'd83,
    parameter id_6 = 32'd12
) (
    id_1,
    id_2,
    _id_3,
    id_4[id_3 : id_6],
    id_5,
    _id_6
);
  output wire _id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  output wire id_1;
  logic id_7;
  wire  id_8;
  ;
  wire id_9;
  or primCall (id_1, id_10, id_4, id_5, id_7, id_8, id_9);
  assign id_8 = id_5;
  localparam id_10 = 1'h0;
  module_0 modCall_1 ();
endmodule
module module_2 ();
endmodule
